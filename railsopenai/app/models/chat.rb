# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  history    :json
#  q_and_a    :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chat < ApplicationRecord
  belongs_to :user

  attr_accessor :message

  def message=(message)
    messages = [{'role' => 'system', 'content' => message}]

    # Adiciona perguntas e respostas anteriores às mensagens
    q_and_a.each do |question, answer|
      messages << {'role' => 'user', 'content' => question}
      messages << {'role' => 'assistant', 'content' => answer}
    end

    messages << {'role' => 'user', 'content' => message} if messages.size > 1

    begin
      response_raw = attempt_api_call(messages)

      # Logando a resposta bruta
      Rails.logger.debug response_raw

      # Parse a resposta JSON para um objeto
      parsed_response = JSON.parse(response_raw.to_json, object_class: OpenStruct)

      # Armazena a pergunta e a resposta em um array
      self.q_and_a << [message, parsed_response.choices[0].message.content]

    rescue => e
      Rails.logger.error "Error communicating with OpenAI: #{e.message}"
    end
  end

  private

  def client
    OpenAI::Client.new # Corrigido o uso do namespace para OpenAI
  end

  def attempt_api_call(messages)
    attempts = 0
    begin
      attempts += 1
      client.chat(
        parameters: {
          model: 'gpt-3.5-turbo',
          messages: messages,
          temperature: 0.7,
          max_tokens: 500,
          top_p: 1,
          frequency_penalty: 0.0,
          presence_penalty: 0.6
        }
      )
    rescue OpenAI::TooManyRequests => e
      if attempts < 5
        sleep(2**attempts) # Exponencial backoff
        retry
      else
        Rails.logger.error "Too many requests: #{e.message}"
        raise e # Re-lança a exceção se o limite de tentativas for alcançado
      end
    end
  end
end

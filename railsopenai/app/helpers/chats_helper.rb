module ChatsHelper
  def list_name(chat)
    if chat.q_and_a.present?
      chat.q_and_a.first[0].truncate(20) # Trunca a pergunta para 20 caracteres
    else
      "Chat #{chat.id}" # Retorna o ID do chat se não houver Q&A
    end
  end
end

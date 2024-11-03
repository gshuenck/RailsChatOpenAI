# RailsChatOpenAI

Este é um projeto de chat simples integrado com a API OpenAI, desenvolvido em Ruby on Rails. O aplicativo permite que os usuários iniciem conversas com a IA da OpenAI, enviando mensagens e recebendo respostas com base no modelo de linguagem GPT-3.5-Turbo.

## Funcionalidades

- **Criação de chats**: Os usuários podem criar novos chats e visualizar o histórico de mensagens.
- **Integração com OpenAI**: Utiliza a API OpenAI para gerar respostas automáticas.
- **Persistência de dados**: Armazena o histórico de perguntas e respostas no banco de dados para cada chat.
- **Interface simples e responsiva**: Interface de usuário para visualização e interação com o chat.

## Tecnologias

- **Ruby on Rails**: Framework principal do projeto.
- **OpenAI API**: Para integração de IA.
- **Bootstrap**: Para estilização básica e responsividade.
- **PostgreSQL**: Banco de dados (pode ser substituído por outro se necessário).

## Pré-requisitos

- Ruby 3.x
- Rails 7.x
- Chave de API da OpenAI
- PostgreSQL ou outro banco de dados compatível

## Configuração

bundle install

Configure o banco de dados:

    Edite config/database.yml com as informações do seu banco de dados.
    Execute as migrações:

    bash

    rails db:create db:migrate

Configure a chave de API da OpenAI:

    Crie um arquivo .env na raiz do projeto e adicione sua chave de API:

    env

    OPENAI_API_KEY=your_openai_api_key

    Instale a gem dotenv-rails (ou configure sua chave de API conforme o ambiente).

Inicie o servidor Rails:

bash

    rails server

    Acesse o aplicativo em http://localhost:3000.

Uso

    Após o login, vá para a página de Chats.
    Clique em "Criar Chat" para iniciar uma nova conversa.
    Insira uma mensagem e envie para receber uma resposta da IA.
    O histórico de perguntas e respostas ficará disponível para visualização.

Estrutura do Projeto

    app/models/chat.rb - Modelo principal que gerencia as interações de chat.
    app/controllers/chats_controller.rb - Controlador que gerencia as ações de criação, exibição e atualização dos chats.
    app/views/chats - Views para interface de usuário.
    config/initializers/openai.rb - Configuração da API OpenAI (adicionar conforme necessário).
    app/helpers/chats_helper.rb - Helpers para exibir as perguntas e respostas.

Contribuição

Contribuições são bem-vindas! Para contribuir:

    Faça um fork deste repositório.
    Crie um branch para sua feature (git checkout -b minha-feature).
    Commit suas alterações (git commit -am 'Adiciona nova feature').
    Faça o push para o branch (git push origin minha-feature).
    Abra um Pull Request.

Licença

Este projeto está licenciado sob a licença MIT - consulte o arquivo LICENSE para mais detalhes.
Contato


## Créditos

Este projeto foi inspirado pelo tutorial disponível no YouTube:

- [Integrando OpenAI com Ruby on Rails](https://www.youtube.com/watch?v=_3AsaXoLdj4&t=545s)

<img width="436" height="959" alt="flutter - 01" src="https://github.com/user-attachments/assets/b138f8a9-4b6a-40e2-b74f-a93913ad5249" /># 🎮 PROJETO FINAL - CATALOGO DE JOGOS 🎮
> Um aplicativo intuitivo para descoberta e gerenciamento de catálogos de jogos.

---

## 📖 Sobre o Projeto 📖

Este projeto consiste em uma aplicação móvel desenvolvida para entusiastas de videogames e para **quem busca novas ideias de jogos mas não sabe onde procurar**.
O objetivo principal é oferecer uma plataforma centralizada onde o usuário pode explorar um vasto catálogo, visualizar detalhes visuais impactantes e gerenciar seus títulos favoritos. Além da descoberta de conteúdo, o sistema possui um módulo completo de gerenciamento de usuários.

---

## 📱 Layout e Funcionalidades

Abaixo estão as telas principais da aplicação. O design foi pensado para ser limpo e focado na experiência do usuário.

| Login | Home | Favoritos |
|:---:|:---:|:---:|
| ![Login](<img width="436" height="959" alt="flutter - 01" src="https://github.com/user-attachments/assets/fdec4ebf-430a-4b05-b4da-8ec9ac3f1a36" />) | 
![Home Screenshot](<img width="451" height="967" alt="flutter - 02" src="https://github.com/user-attachments/assets/426e8adc-5cb5-4b09-803d-aafd01f7c1ac" />) | 
![Favoritos Screenshot](<img width="451" height="967" alt="flutter - 03" src="https://github.com/user-attachments/assets/99109e93-fec1-4a32-bc97-3baa79a1c3af" />) |
| *Autenticação* | *Listagem via API RAWG* | *Gestão de Favoritos* |

| Usuários (Lista) | Perfil | Cadastro/Edição |
|:---:|:---:|:---:|
| ![Usuarios Screenshot](<img width="446" height="961" alt="flutter - 04" src="https://github.com/user-attachments/assets/2087f9b2-1412-41e3-a367-b69b8f5f6a89" />) |
![Perfil Screenshot](<img width="438" height="974" alt="flutter - 05" src="https://github.com/user-attachments/assets/2d43eba2-aac4-4116-bcf8-48a55fa4edf1" />) |
![Formulario Screenshot](<img width="442" height="975" alt="Flutter - 06" src="https://github.com/user-attachments/assets/527d63a3-318b-475e-be98-7825a7e4a3a3" />) |
| *Visualização CRUD* | *Dados do usuário logado* | *Inclusão e alteração* |

### Descrição Detalhada das Telas

- **🔐 Login:** Interface responsável pela autenticação e entrada segura no sistema.
- **🏠 Home:** O coração do app. Consome a API de Games para retornar uma listagem visual (Cards) contendo o nome e a imagem dos jogos, com funcionalidade de "Favoritar" integrada diretamente no feed.
- **❤️ Favoritos:** Área dedicada para o usuário visualizar, gerenciar e remover os jogos que marcaram como preferidos.
- **👥 Usuários:** Tela administrativa que exibe a listagem de usuários cadastrados no sistema, servindo como a visualização principal do CRUD.
- **👤 Perfil:** Exibe os dados do usuário atualmente logado (ex: Nome), oferecendo opções para editar informações pessoais ou realizar o Logout.
- **📝 Cadastro/Alteração:** Formulário reativo e dinâmico reutilizado tanto para a criação de novos usuários quanto para a edição de registros existentes.

---

## 🛠 Tecnologias e Arquitetura

### 🔗 API Externa: RAWG Video Games Database
Para popular o catálogo, foi utilizada a **[RAWG API](https://rawg.io/apidocs)**. Ela é responsável por fornecer os endpoints que retornam os dados essenciais para a experiência de descoberta, como:
- Títulos dos Jogos.
- Imagens de alta resolução (Background Images).
- Metadados relevantes para a listagem.

### ⚡ Gerência de Estado: GetX
A arquitetura do projeto foi construída utilizando o **GetX** como solução central. A escolha desta ferramenta se baseou em três pilares:

1.  **Versatilidade:** O GetX vai além da gerência de estado, oferecendo soluções robustas para Injeção de Dependência e Gerenciamento de Rotas/Navegação sem necessidade de contexto.
2.  **Performance:** Otimização de recursos sem uso excessivo de Streams ou ChangeNotifier.
3.  **Produtividade e Curva de Aprendizado:** A sintaxe do GetX permite um código mais limpo e legível, facilitando a manutenção e o entendimento geral da lógica de negócios.

---

## 🚀 Como executar o projeto

### Pré-requisitos
- Flutter SDK instalado.
- Emulador Android/iOS ou dispositivo físico configurado.
- Chave de API da [RAWG.io](https://rawg.io/apidocs).

### Instalação

1. Clone o repositório:
```bash
git clone [https://github.com/seu-usuario/nome-do-projeto.git](https://github.com/seu-usuario/nome-do-projeto.git)

![logo](https://github.com/Vini-Coding/desafio/assets/89312086/16789b59-e75b-48e9-8466-df60123acbf5)
# PROTECHTOR GEARS
![GitHub last commit](https://img.shields.io/github/last-commit/Vini-Coding/desafio)  
Protechtor Gears é o seu aplicativo para filtragem de senhas, com ele você pode filtrar senhas fortes em uma lista, adicionar uma senha vendo em tempo real se ela atende ou não aos critérios de senha forte, editar e deletar senhas. Não perca tempo e se Proteja no mundo tech com o Protechtor Gears. 

## Features
- Filtragem de senhas Fortes e Fracas.
- Conexão com API.
- Adição, Leitura, Edição e Deleção de senhas.  

## Como utilizar
Você pode utilizar o aplicativo baixando o apk: [Baixar APK](https://drive.google.com/drive/u/0/folders/11xzgb9SqmVj72JzES5GylaDy5r66eW4A)

Ou seguir o seguinte passo-a-passo:
1. Para usar essa aplicação, primeiro você deve clonar esse repositório. Você pode clonar com a seguinte linha de comando:
```
git clone https://github.com/Vini-Coding/desafio
```
2. Segundamente, você pode abrir o projeto em seu editor de códigos.
3. E então, rodar o aplicativo com seguinte comando:
```
flutter run lib/main.dart
```
# Minha Experiência com o Desafio
De começo, já adianto que achei a ideia do desafio de avaliar o aprendizado e a proatividade para o mesmo muito interessante, me fez querer sair da caixinha e buscar desenvolver novas habilidades úteis como Júnior. Sou um desenvolvedor Flutter e resolvi utilizar o framework para desenvolver minha solução para o desafio.

Tive a ideia de utilizar uma API Rest "falsa" de senhas para o meu desafio, pois eu havia praticado APIs Rest apenas com o método Get, e não sabia nada de como utilizar os outros métodos, então resolvi me desafiar a aprender a utilizar de forma prática os 4 métodos http em um Projeto Flutter. Para validar as senhas, consultei um amigo que é Pleno e perguntei sobre a melhor forma de fazer validações com Flutter, ele me recomendou Regex, Expressões Regulares, coisa que eu também nunca tinha ouvido falar. E então o core do meu projeto surgiu. Um aplicativo que filtra uma lista de senhas, que recebe de uma API, realiza as 4 operações CRUD com elas e valida as senhas através de Expressões Regulares.

## Design da UI
No início do aplicativo, como de costume, fui pesquisar a Branding por trás da Empresa Athletic Gear. Gosto muito de estudar Design, Branding e Design de Interfaces, então um hábito que mantenho sempre é gerar a UI antes do código, e sempre tentando ao máximo ser fiel à marca que aquele aplicativo representa.
![image](https://github.com/Vini-Coding/desafio/assets/89312086/7bdf4399-d26a-46a6-9e19-ecb1ea5231b8)

Após o estudo de Branding, eu comecei a fazer o Design da Interface:

![image](https://github.com/Vini-Coding/desafio/assets/89312086/7029eda6-87f0-4d9a-ab02-cc965d25876d)
- Você pode checar o meu arquivo Figma [clicando aqui!](https://www.figma.com/file/7mXSThN8tNtZtuvagSTAZQ/Athletic-Gears-Challenge---Password-Validator-App?type=design&node-id=1%3A2&t=POrHAOzA6sR99phE-1)

## Codando
E após o design da Interface, foi tempo de colocar as mãos na massa. 

### Informações Gerais
- Usei ChangeNotifier e ValueNotifier para gerência de estado.
- Package injector para injeção de Dependências
- Implementação de Themes utilizando Material 3
- Conexão com API através do package http
- SharedPreferences para persistência de dados locais
- Rotas Nomeadas para navegação

### Minha Estrutura de Arquivos
Minha Estrutura de Arquivos nesse projeto foi a seguinte:
- Arquivos view para interfaces
- Arquivos widgets para components
- Arquivos controller para regra de negócios
- Arquivos model para modelos
- Arquivos service para serviços
- Theme e utilitários na pasta shared.

### Intro Views
Eu sempre tinha o costume de usar o package introduction_screens para criar Telas de Introdução, usei em praticamente todos os meus apps que possuíam esse tipo de tela, mas haviam algumas limitações, por exemplo: eu não conseguia alterar a ordem dos elementos, como colocar o título acima da imagem, e também não conseguia criar uma tela de "Get Started" na última tela. O Desafio então me inspirou a criar minhas próprias telas de Introdução. 
- E então eu fui buscar no Youtube sobre e encontrei o seguinte vídeo: https://www.youtube.com/watch?v=c4dsvckUA1Q

Nesse vídeo aprendi que é bem simples criar esse tipo de Widget se você utilizar um PageView.builder() e usar um PageController e um inteiro que representava o index da página. Criei então o meu próprio Widget de Page, que recebia apenas o conteúdo necessário nos parâmetros como título, caminho da imagem, e descrição. E como ter o controle do index e da interface me deu liberdade, fiz uma lógica para a última tela ser uma tela de "Get Started". Utilizei sharedPreferences para validar se era a primeira entrada do usuário para setar se as telas de introdução vão aparecer ou não para o usuário.

### Home View
Na HomeView, o meu primeiro desafio foi encontrar um Widget para o Filtro que eu queria desenvolver, e fazendo uma pesquisa no Youtube eu encontrei o Widget ToggleButtons(). Primeiro eu avessei o seguinte vídeo...

[Em breve continuação do ReadMe]

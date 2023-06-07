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

Meu amigo pleno me recomendou o site [Mock API](https://mockapi.io/) para que eu criasse minha API, ele permite criar quantos mocks forem necessários e é bem útil para se familiarizar mais com APIs Rest. Então eu criei uma API de senhas que possuía 3 campos, a senha, a data que foi criada e seu id. 
- [Clique aqui para acessar minha API](https://64790e0ba455e257fa62e151.mockapi.io/athleticGears/passwords)

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
Na HomeView, o meu primeiro desafio foi encontrar um Widget para o Filtro que eu queria desenvolver, e fazendo uma pesquisa no Google eu encontrei o Widget ToggleButtons()
- Primeiro eu acessei a documentação do Widget e conferi seu vídeo: https://www.youtube.com/watch?v=kVEguaQWGAY&pp=ygUYdG9nZ2xlIGJ1dHRvbiBpbiBmbHV0dGVy 
- Em seguida eu fui conferir um vídeo do canal Hey Flutter, do quadro "Deep dive" onde ele analisa os widgets e testa: https://www.youtube.com/watch?v=v2QGS4UqaqA&t=241s 
- E por último, utilizando a [Documentação](https://api.flutter.dev/flutter/material/ToggleButtons-class.html) como base, criei minha própria versão de ToggleButtons() para meu filtro de senhas.

![WhatsApp-Video-2023-06-07-at-10 25 28](https://github.com/Vini-Coding/desafio/assets/89312086/a6bcefca-ee0d-46e0-bd28-93ef34af41ec)

Eu precisava fazer minha estrutura para receber uma API em meu aplicativo, e para aprender sobre como fazer bem, eu estudei os 3 vídeos seguintes:
- [REST API with FLutter | Step by step tutorial](https://www.youtube.com/watch?v=c09XiwOZKsI) : nesse eu revisei requisições GET com o package http.
- [Understand REST API 📲](https://www.youtube.com/watch?v=qr8-B0BVelc) : nesse eu aprendi mais sobre a parte teórica das APIs Rest, sua diferença de APIs comuns, sobre CRUD e diferentes tipos de status code. 
- [REST Call with Flutter - Http methods](https://www.youtube.com/watch?v=jpLa3NjWqs0&t=731s) : por fim teve esse vídeo bem completo sobre os 4 métodos http com Flutter, que me auxiliou para que eu fizesse as 4 operações em meu app.

E então seguindo os passos do primeiro vídeo, eu conectei meu aplicativo com minha API e deixei pronta meu serviço de get, com uma função no controller de minha Home que ativava o meu service. Utilizei um widget Visibility para exibir a animação de carregamento enquanto a requisição não retorna a response e um ListView.builder para criar minha lista de senhas com os dados retornados da API.

Para filtrar, eu fiz o seguinte processo: 
- Criei uma lista que receberia todas as senhas. 
- Em seguida eu criei um Enum chamada FilterListBy que possuía os valores "all", "weaks" e "strongs" e criei uma variável desse tipo no meu Controller. 
- Em seguida outra lista que seria a listra filtrada de nome "filteredList", que utilizava um getter e dentro desse gettter eu tinha um loop para cada item da Lista completa fazer uma verificação de acordo com a variável do filtro:
![image](https://github.com/Vini-Coding/desafio/assets/89312086/45e71671-b7bd-40ca-b918-d3b25ab802eb)
- Dessa forma, minha lista já seria filtrada e atualizada automaticamente sempre que o valor do filtro fosse trocado.
- Para isso funcionar, meu widget do filtro chamava uma funções em seu OneTap quando uma opção era clicada, e ele passava essa opção para a variável do Filtro no controller, e através do ChangeNotifier, o estado da tela é atualizado.

Para validar as senhas fortes, eu então tive que pesquisar e aprender Expressões Regulares, a base necessária para que eu construísse as expressões que eu queria. Inicialmente eu assisti os vídeos a seguir:
- [Aprenda tudo sobre RegEx em menos de 10 minutos! Com exemplos práticos](https://www.youtube.com/watch?v=d2uqo6PhdM4&t=304s) do canal CódigoEscola: nesse vídeo eu tive minha primeira formação sobre o que eram Expressões regulares, em que caso utilizamos ela e algumas bases de sua sintaxe.
- [Flutter Regex](https://www.youtube.com/watch?v=53zJinThIsY) do canal Code Drops: Foi útil para que eu entendesse como combinar as Expressões Regulares em uma aplicação Flutter.
Com essas bases criadas, eu criei uma pasta de "utils" na minha pasta "shared" e coloquei as minhas funções de validação regex, que fazem a validação e retornam true ou false dependendo do Match da expressão com o valor, e dessa forma foi simples validar senhas por todo meu código, sempre que eu precisava eu chamava uma de minhas funções de validação utilitárias. Inclusive na minha função de filtragem.


### Adicionar e Editar
Para adição e edição eu iria criar Widgets diferentes mas meu amigo pleno me deu a dica de que nos aplicativos dele, ele geralmente utiliza o mesmo componente pra adicionar e editar, e vi que nesse caso fazia sentido, só precisaria ajustar a lógica.
Eu queria utilizar um Widget de adição que validasse enquanto o usuário digita, assim como havia planejado em minha UI. 
- E com uma pesquisa na internet, achei um tutorial em vídeo perfeito sobre: [Você pode conferir clicando aqui](https://www.youtube.com/watch?v=Uahlo90ER18)
Adaptando para o meu design, criei um Widget Pop-Up versátil para adição ou edição. Esse widget recebia por parâmetros, o título, o comando do botão, uma função para o botão e um parâmetro opcional de senha para caso fosse edição. 
- Foi necessário criar um controller próprio para esse Widget.
Para meus critérios de validação eu criei um Container redondo com visibility, e fiz uma lógica com o controller para validar o critério correpondente àquela linha, em que o Container ficaria verde caso o critério fosse validado e ficaria transparente caso não fosse. Utilizei a mesma lógica para o botão.
- E no próprio Controller de minha Home, criei os métodos para edição e adição, e chamei eles na função que meu widget recebia da Home por parâmetros.

![WhatsApp-Video-2023-06-07-at-11 15 06](https://github.com/Vini-Coding/desafio/assets/89312086/b5823d70-d1c5-4e80-a656-4660405e02e4)

### Deletar
Para Deleção, criei um Widget Pop-Up de confirmação pensando na experiência do usuário, para caso ele clicasse no botão sem querer. E esse widget recebia por parâmetro a senha para exibir ela, e uma função de deleção, que na HomeView() eu passei a função de delete do Controller, que processa meu serviço de deleção

![WhatsApp-Video-2023-06-07-at-11 34 11-_1_](https://github.com/Vini-Coding/desafio/assets/89312086/364b3718-71ae-4098-9606-ed3e738b8783)

## Próximos Passos
- SnackBars de Feedback ao Usuário
- Tratamento de Exceptions
- Correção no App Icon

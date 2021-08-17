# pokemon

Desafio da NG Informática

## Como executar o aplicativo
 
Executar no computador ( comandos )
- flutter pub get
- flutter run

Observação
- Caso não tenha os arquivos do mobx controller.g.dart, execute
- - flutter pub run build_runner build --delete-conflicting-outputs

Executar no dispositivo Android 
- Baixe o APK no link
- - https://drive.google.com/file/d/1Ys94t2QtRFKZIthhUyD7yP8iacrYeeXS/view?usp=sharing
- Instale o aplicativo

## Documentação

# Splash

Objetivo do módulo é verificar se o usuário já está autenticado

Funções 
- checkUser 
- - Sem parâmetros
- - Verifica o usuário atráves do Firebase Auth.
- - Chamado 1 segundo após abrir a tela.

# Auth 

Objetivo do módulo é se autenticar atráves da plataforma do Gmail

Funções
- signInWithGoogle
- - Sem parâmetros
- - Faz o login com o Gmail
- - Chamado após clicar no botão de "Entrar com o Google"

# Home 

Objetivo do módulo é registrar os pokémons avistados e pegos, buscar todos os pokémons favoritos de um usuário e gerenciar pokémons pegos e os comentários de cada um;

Passos para registrar o pokémon
- Procure um pokémon
- Clique no cartão do pokémon
- - Salvará como visto
- Tente capturar
- - Se capturar salvará como capturado

Passos para favoritar ou desfavoritar um pokémon 
- Clique no coração no cartão do pokémon
- Abra a tela de detalhes clicando no cartão do pokémon
- - Clique no coração ao lado do nome

Passos para editar ou abandonar um pokémon
- Clique no cartão do pokémon DENTRO da tab CAPTURADOS
- Edição
- - Mude a observação e clique em EDITAR POKÉMON
- Abandonar 
- - Clique em abandonar pokémon e confirme.


## Galeria

<img src="/prints/splash.png" alt="Splash Screen"/>
<img src="/prints/auth.png" alt="Auth Screen"/>
<img src="/prints/home_dex.png" alt="Home Pokédex Screen"/>
<img src="/prints/home_catch.png" alt="Home Catch Screen"/>
<img src="/prints/home_fav.png" alt="Home Favorite Screen"/>
<img src="/prints/details_normal.png" alt="Details Normal Screen"/>

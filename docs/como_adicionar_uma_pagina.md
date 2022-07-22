# Como Adicionar uma Página

Existem dois tipos de página no aplicativo:

- Páginas de formulário
- Páginas de resultado

## Páginas de Formulário

As páginas de formulário são as páginas responsáveis por exibir as perguntas e respectivas ações que o usuário deve responder para avançar no fluxo:

Alguns exemplos de páginas de formulário são:

- Página preferencial (``is_preferential_page.dart``)
- Página tipo de agendamento (``appointment_type_page.dart``)
- Página para informar número hc (``request_hc_number_page.dart``)

![image](https://user-images.githubusercontent.com/37855969/180341325-e59b553e-1a0c-45db-b3a9-b705ba7110ef.png)


### Como adicionar uma página de formulário

As páginas de formulário utilizam o Widget `GenericFormPage`, esse componente possui os seguintes parâmetros que podem ser passados no seu construtor:

- ``String previousOption`` (required)
  - String contendo qual opção levou para essa página
- ``String question`` (required)
  - String contendo a pergunta da página
- ``Widget centralWidget`` (required)
  - Componente central que será exibido na página
    - ``OptionTileList`` (eg. escolher especialidade)
    - ``OptionButtonList`` (eg. tipo de agendamento)
    - ``OpenTextInput`` (eg. informar número hc)
- ``int inputFlex`` (Default: 2)
  - Proporção da tela que o centralWidget irá ocupar
  - Opção padrão é 2/5
- ``void Function()? onAdvance``
  - Função que será executada quando o botão azul (``CONFIRMAR``) é pressionado
  - Caso a função seja ``null``, o botão não é renderizado na tela
- ``NotMappedButton? notMappedButton``
  - NotMappedButton contendo o comportamento e dados do botão que deve ser pressionado quando deve ir a um fluxo alternativo (eg. ``Não sei meu número HC``)
  - Caso o valor seja ``null``, o botão não é renderizado na tela

## Páginas de Resultado

As páginas de resultado são responsáveis por exibir ao usuário o resultado final de um determinado fluxo, deixando claro para ele uma ação específica para se tomar.

Alguns exemplos de páginas de resultado são:

- Página sala 23 (``go_to_room_23_page.dart``)
- Página linha amarela (``go_to_yellow_track_page.dart``)
- Página contendo senha (``pick_number_page.dart``)

![image](https://user-images.githubusercontent.com/37855969/180341242-a6593284-9a30-4a26-bbc7-7f364fe70cdb.png)


### Como adicionar uma página de resultado

As páginas de formulário utilizam o Widget `GenericResultPage`, esse componente possui os seguintes parâmetros que podem ser passados no seu construtor:

- ``String pageTitle`` (required)
  - String contendo o título da página
- ``String mainText`` (required)
  - String contendo o texto principal da página
- ``String secondaryText`` (required)
  - String contendo o texto que é renderizado abaixo do resultado dado
- ``Text dataText`` (required)
  - Widget Text contendo o dado que será renderizado (eg. Faixa Amarela)
- ``void Function()? onAdvance``
  - Função que dita o comportamento do botão azul (``CONFIRMAR``)
  - Caso a função seja ``null``, o botão não é renderizado na tela
- ``void Function()? onBack``
  - Função que dita o comportamento do botão vermelho (`VOLTAR`)
  - Caso a função seja ``null``, o botão não é renderizado na tela

# eaki - O seu guia para o HC

Eaki é um repositório mantido por estudantes da Unicamp para ajudar a organizar as filas da pediatria do HC. O problema apresentado está relacionado à confusão que os pacientes possuem em entender quais filas devem ser seguidas para os seus casos específicos.

![hc unicamp](https://emc.acidadeon.com/dbimagens/hospital_de_1200x675_14032022193341.jpg)

## Solução

O eaki é um app multiplataforma desenvolvido em flutter com as seguintes funcionalidades (ainda em desenvolvimento):

- Formulário que funciona como um guia para indicar o caminho correto no HC
- Exibição da senha numérica atualizada em tempo real
- Controle da fila (área de adm)

## Como Executar

Instale o flutter em sua máquina: <https://docs.flutter.dev/get-started/install>

Digite os seguintes comandos no terminal:

- flutter pub get
- flutter run

Também é possível ver o aplicativo sendo executado no site: <https://eaki-unicamp.web.app>

## Implementação

O código segue uma arquitetura MVVM, sendo todo armazenado dentro da pasta `lib/`.

### Model

O código referente a camada Model pode ser encontrado nos seguintes diretórios:

- `repository/`
  - Armazena a lógica de dados
- `models/`

### View

O código referente a camada View pode ser encontrado nos seguintes diretórios:

- `providers/`
  - Armazena os estados da view
- `components/`
- `pages/`

### ViewModel

O código referente a camada ViewModel está todo contido no diretório `viewmodels/`


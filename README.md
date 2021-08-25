# BuckSample

Exemple de configuração do buck com xcodegen e makefile

## Instalação

### Buck

Para instalar as dependências do buck [aqui](https://buck.build/setup/getting_started.html) ou pelo exemplo abaixo usando o [brew](https://brew.sh):

```
brew install ant python watchman git
```

### xcodegen

Neste exemplo usamos também o xcodegen. Para instalar o xcodegen você pode fazer por [aqui]() ou com o comando abaixo usando o [brew](https://brew.sh):

```
brew install xcodegen
```

### xcpretty

Neste exemplo também uso o [xcpretty](https://github.com/xcpretty/xcpretty) para uma melhor apresentação dos builds:

```
gem install xcpretty
```
Ele não é obrigatorio. no setup já é configurado ele para usar local.



## Setup do projeto

Execute o comando a seguir para configurar o projeto:

```
make setup
```
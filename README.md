# Tads6_Guilherme

  Este é um trabalho da faculdade de Tecnologia e Analise e Desenvolvimento, dado pelo professor para que os estudantes aprendam o uso e de bibliotecas (gem). Além disso, relaciona-se ao conteúdo teórico sobre ORM (Mapeamento Objeto Relacional), os quais foram mostrados nas aulas de Tópicos Especiais em Tecnologia da Informação no IFMS 6º Semestre, Campus de Naviraí.

## Instalação

Caso use um arquivo Gemfile, baixado manualmente adicione o código abaixo:

```ruby
gem 'tads6_guilherme'
```

Logo após instale as dependências:

    $ bundle install

Ou, instale diretamente a gem executando o código abaixo em seu terminal:

    $ gem install tads6_guilherme

## Como utilizar

Para utilizar a `gem` deve-se realizar os seguintes passos:

Primeiro crie um novo arquivo e adicione uma classe a qual você deseja persistir seguindo as especificações abaixo:

```ruby
# Require necessário
require 'tads6_guilherme'

# Sua classe deve herdar a classe Tads6_Guilherme::ORM
class ExemploClasse < Tads6_Guilherme::ORM
  # Toda classe deve conter um :ID obrigatoriamente
  attr_accessor :id, :modelo

  # O construtor deve seguir o exemplo abaixo
  def initialize(hash)
    @titulo = hash.first[:modelo]
  end

  # Este método deve ser reescrito obrigatoriamente com o
  # caminho para seu banco de dados 'db/nomeclasseminúsculo'
  def self.path
    'local/onde/deseja/salvar/os/dados'
  end
end
```
## Passo a Passo

Crie o diretório com o caminho especificado no método `self.path`

### Criar um novo registro:
```ruby
ExemploClasse.criar(
  modelo: 'Corsa Maxx'
)
```

### Listar todos os registros:
```ruby
puts ExemploClasse.listar
```

### Selecionar o registro
```ruby
puts ExemploClasse.selecionar(1)
```

### Atualizar o registro
```ruby
carro = ExemploClasse.selecionar(1)
carro.modelo = "novo modelo"
ExemploClasse.atualizar(carro)
```

### Remover o registro
```ruby
ExemploClasse.remove(1)
```
## Importante

 - O atributo id deve estar contido, porem ele não deve ser inicializado.
 - O método path obrigatoriamente deve ser reescrito para o local onde você deseja salvar os dados

```ruby
  def self.path
    'local/onde/deseja/salvar/os/dados'
  end
```

## Licença

A gem está disponível como código aberto sob os termos do [MIT License](https://opensource.org/licenses/MIT).

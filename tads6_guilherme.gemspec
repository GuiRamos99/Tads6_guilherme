
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tads6_guilherme/version"

Gem::Specification.new do |spec|
  spec.name          = "tads6_guilherme"
  spec.version       = Tads6_Guilherme::VERSION
  spec.authors       = ["GuiRamos99"]
  spec.email         = ["guilhermedesramos@gmail.com"]

  spec.summary       = "Gem básica para Mapeamento Objeto Relacional"
  spec.description   = "Este é um projeto desenvolvido para  demostrar aos estudantes o uso e a aplicação de bibliotecas (gem) para o encapsulamento funcionalidades genéricas que podem ser utilizadas em outros projetos. Outro objetivo atrelado a esta atividade relaciona-se ao conteúdo teórico sobre ORM (Mapeamento Objeto Relacional), os quais foram apresentados em aulas de Tópicos Especiais em Tecnologia da Informação no Institulo Federal de Mato Grosso do Sul, Campus de Naviraí, e são aplicados de forma prática neste."
  spec.homepage      = "http://www.ifms.edu.br"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

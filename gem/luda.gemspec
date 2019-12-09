$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "luda/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "luda"
  spec.version     = Luda::VERSION
  spec.authors     = ["oatw"]
  spec.email       = ["oatwoatw@gmail.com"]
  spec.homepage    = "https://oatw.github.io/luda"
  spec.summary     = "A library helps to build cross-framework UI components."
  spec.license     = "MIT"

  spec.files = Dir["{assets,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'sass', '>= 3.7.3'

end
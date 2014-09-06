$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lattes_server/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lattes_server"
  s.version     = LattesServer::VERSION
  s.authors     = ["Rodrigo Manhães"]
  s.email       = ["rmanhaes@gmail.com  "]
  s.homepage    = "https://github.com/nsi-iff/lattes_server"
  s.summary     = "Lattes for the masses."
  s.description = "Lattes for the masses."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency 'lattes_api', '~> 0'
  s.add_development_dependency "rspec-rails", '~> 3.0'
  s.add_development_dependency "pry-rails"
end

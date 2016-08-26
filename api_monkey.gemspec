$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'api_monkey/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'api_monkey'
  s.version     = ApiMonkey::VERSION
  s.authors     = ['Michael Kelly']
  s.email       = ['michaelkelly322@gmail.com']
  s.homepage    = 'https://github.com/thebadmonkeydev/api_monkey'
  s.summary     = 'A Rails 5 engine to expose REST endpoints for your application'
  s.description = '
ApiMonkey is a Rails 5 engine designed to make data-driven API
development a breeze by eliminating the boilerplate necessary for a
standard Rails REST API.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.0'

  s.add_development_dependency 'sqlite3'
end

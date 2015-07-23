# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_resource/version'

Gem::Specification.new do |spec|
  spec.name          = "api_resource"
  spec.version       = ApiResource::VERSION
  spec.authors       = ["Michael Kelly"]
  spec.email         = ["michaelkelly322@gmail.com"]

  spec.summary       = "Makes building data-driven APIs in Rails a breeze"
  spec.description   = "Makes building data-driven APIs in Rails a breeze by providing an easy to use DSL for declaring API resources"
  spec.homepage      = "https://github.com/michaelkelly322/api_resource"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

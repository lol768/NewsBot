# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'NewsBot/version'

Gem::Specification.new do |spec|
  spec.name          = 'NewsBot'
  spec.version       = NewsBot::VERSION
  spec.authors       = ['lol768']
  spec.email         = ['newsbot@lol768.com']
  spec.summary       = %q{IRC bot that provides news alerts.}
  spec.homepage      = 'https://github.com/lol768/NewsBot'
  spec.license       = 'GNU GPLv3'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency 'cinch'
  spec.add_dependency 'json'
  spec.add_dependency 'net'
  spec.add_dependency 'cinch-commands', '~> 0.1.0'
  spec.add_dependency 'PriorityQueue', '~> 0.1.2'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'turn'

end
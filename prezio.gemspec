# -*- encoding: utf-8 -*-
require File.expand_path('../lib/prezio/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Pohorecki"]
  gem.email         = ["adam@pohorecki.pl"]
  gem.description   = %q{HTML5 presentation generator}
  gem.summary       = %q{HTML5 presentation generator}
  gem.homepage      = "http://github.com/psyho/prezio"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "prezio"
  gem.require_paths = ["lib"]
  gem.version       = Prezio::VERSION

  gem.add_dependency 'sinatra'
  gem.add_dependency 'commander'
  gem.add_dependency 'pygments.rb'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rspec'
end

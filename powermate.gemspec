# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'powermate/version'

Gem::Specification.new do |gem|
  gem.name          = "powermate"
  gem.version       = Powermate::VERSION
  gem.authors       = ["Lex Childs"]
  gem.email         = ["lexchilds@gmail.com"]
  gem.description   = %q{powermate events}
  gem.summary       = %q{powermate events}
  gem.homepage      = ""

  dependencies = %w''
  dependencies.each do |d|
    gem.add_dependency d
  end

  dependencies = %w'rake minitest'
  dependencies.each do |d|
    gem.add_development_dependency d
  end

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

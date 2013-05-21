# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'png-encode/version'

Gem::Specification.new do |gem|
  gem.name          = "png-encode"
  gem.version       = PNG::Encode::VERSION
  gem.authors       = ["Ryan LeFevre"]
  gem.email         = ["meltingice8917@gmail.com"]
  gem.description   = %q{Encode/decode arbitrary data within the PNG file format}
  gem.summary       = %q{Encode/decode arbitrary data within the PNG file format}
  gem.homepage      = "http://github.com/meltingice/png-encode"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'chunky_png'
end

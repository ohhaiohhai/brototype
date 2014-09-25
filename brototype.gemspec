# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brototype/version'

Gem::Specification.new do |spec|
  spec.name          = "brototype"
  spec.version       = Brototype::VERSION
  spec.authors       = ["Eric"]
  spec.email         = ["ericschleeper@gmail.com"]
  spec.summary       = %q{Bro, do you even Ruby?}
  spec.description   = %q{Ruby port of the popular brototypejs library.}
  spec.homepage      = "https://github.com/eschleeper/brototype"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end

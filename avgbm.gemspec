# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avgbm/version'

Gem::Specification.new do |spec|
  spec.name          = "avgbm"
  spec.version       = Avgbm::VERSION
  spec.authors       = ["Girish S"]
  spec.email         = ["girish.sonawane@gmail.com"]
  spec.summary       = %q{Adds avgbm method to Ruby Benchmark std lib.}
  spec.description   = %q{Adds Benchmark.avgbm method, that discards highest/lowest times and averages the remaining results.}
  spec.homepage      = "https://github.com/girishso/avgbm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

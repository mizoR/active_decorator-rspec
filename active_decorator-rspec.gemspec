# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_decorator/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "active_decorator-rspec"
  spec.version       = ActiveDecorator::RSpec::VERSION
  spec.authors       = ["mizokami"]
  spec.email         = ["suzunatsu@yahoo.com"]
  spec.summary       = %q{ActiveDecorator::RSpec}
  spec.homepage      = "https://github.com/mizoR/active_decorator-rspec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", ">= 3.0"
  spec.add_dependency "actionpack"
  spec.add_dependency "active_decorator"
  spec.add_dependency "activesupport"
end

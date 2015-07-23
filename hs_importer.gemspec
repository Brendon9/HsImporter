# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hs_importer/version'

Gem::Specification.new do |spec|
  spec.name          = "hs_importer"
  spec.version       = HsImporter::VERSION
  spec.authors       = ["Brendon Harris"]
  spec.email         = ["brendon.harris9@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]  

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'dante'
  spec.add_runtime_dependency 'filewatch'
  spec.add_runtime_dependency 'eventmachine-tail', '~> 0.6.4'
  spec.add_runtime_dependency 'em-http-request', '~> 1.1.2'
  spec.add_runtime_dependency 'activesupport', '~> 4.1.0'
end

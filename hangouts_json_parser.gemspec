# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hangouts_json_parser/version'

Gem::Specification.new do |spec|
	spec.name          = "hangouts_json_parser"
	spec.version       = HangoutsJsonParser::VERSION
	spec.authors       = ["Tim van Dalen"]
	spec.email         = ["tim.vandalen@nubisonline.nl"]

	spec.summary       = "Parses JSON formatted Hangouts data (from Takeout or the 'API') into more useful data structures"
	spec.homepage      = "https://github.com/nubisonline/hangouts_json_parser"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.11"
	spec.add_development_dependency "rake", "~> 10.0"

	spec.add_runtime_dependency "ruby_dig", '~> 0.0.2'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'govuk/lint/version'

Gem::Specification.new do |spec|
  spec.name          = "govuk-lint"
  spec.version       = Govuk::Lint::VERSION
  spec.authors       = ["Government Digital Service"]
  spec.email         = ["govuk-dev@digital.cabinet-office.gov.uk"]

  spec.summary       = %q{A wrapper around rubocop, configured with the GDS style guides}
  spec.description   = %q{Include this in your project to easily validate it against the GDS style guides}
  spec.homepage      = "https://github.com/alphagov/govuk-lint"

  spec.files         = Dir["{configs,lib,bin}/**/*"]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.3"

  spec.add_dependency "rubocop", "~> 0.58"
  spec.add_dependency "rubocop-rspec", "~> 1.28"
  spec.add_dependency "scss_lint"
end

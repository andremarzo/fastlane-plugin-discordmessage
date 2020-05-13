# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/discordmessage/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-discordmessage'
  spec.version       = Fastlane::Discordmessage::VERSION
  spec.author        = 'André Marzo'
  spec.email         = 'andremarzo@gmail.com'

  spec.summary       = 'Send a generic message to discord'
  spec.homepage      = "https://github.com/andremarzo/fastlane-plugin-discordmessage"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency('discordrb', '~> 3.3')
  spec.add_development_dependency('pry', '~> 0.13.1')
  spec.add_development_dependency('bundler', '~> 2.1.4')
  spec.add_development_dependency('rspec', '~> 3.9.0')
  spec.add_development_dependency('rspec_junit_formatter', '~> 0.4.1')
  spec.add_development_dependency('rake', '~> 13.0.1')
  spec.add_development_dependency('rubocop', ' ~> 0.49.1')
  spec.add_development_dependency('rubocop-require_tools', '~> 0.1.2')
  spec.add_development_dependency('simplecov', '~> 0.18.5')
  spec.add_development_dependency('fastlane', '~> 2.146.1')
end

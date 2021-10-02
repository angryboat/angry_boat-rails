# frozen_string_literal: true

require_relative 'lib/angry_boat/version'

Gem::Specification.new do |spec|
  spec.name          = 'angry_boat-rails'
  spec.version       = AngryBoat::VERSION
  spec.authors       = ['Maddie Schipper']
  spec.email         = ['maddie@angryboat.com']

  spec.summary       = 'AngryBoat Rails helper gem'
  spec.description   = ''
  spec.homepage      = 'https://github.com/angryboat/angry_boat-rails'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/angryboat/angry_boat-rails'
  spec.metadata['changelog_uri'] = 'https://github.com/angryboat/angry_boat-rails'

  spec.files = Dir['{lib}/**/*', 'Rakefile', 'README.md']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end

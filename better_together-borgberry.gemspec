# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'better_together/borgberry/version'

Gem::Specification.new do |spec|
  spec.name = 'better_together-borgberry'
  spec.version = BetterTogether::Borgberry::VERSION
  spec.authors = ['Robert JJ Smith']
  spec.email = ['rob@bettertogethersolutions.com']
  spec.summary = 'Optional C3 Tree Seeds + Borgberry fleet extension for Better Together Community Engine'
  spec.description = 'Provides the C3 community-contribution-token system, its federation token-seed ' \
                     'layer, the Joatu settlement bridge, and Borgberry fleet-node compute-contribution ' \
                     'tracking as an optional, non-bundled Community Engine extension.'
  spec.homepage = 'https://github.com/better-together-org'
  spec.license = 'LGPL-3.0-or-later'
  spec.required_ruby_version = '>= 3.2'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['{app,lib,db}/**/*', '*.gemspec', 'README.md', 'LICENSE*']
  spec.require_paths = ['lib']

  spec.add_dependency 'better_together', '>= 0.11.0'
end

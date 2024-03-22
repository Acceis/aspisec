# frozen_string_literal: true

require_relative 'lib-ruby/aspisec/version'

Gem::Specification.new do |s|
  s.name          = 'aspisec'
  s.version       = Aspisec::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'xxx'
  s.description   = 'yyy'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@europe.com'
  s.homepage      = 'https://acceis.github.io/aspisec/'
  s.license       = 'MIT'

  s.files         = Dir['bin-ruby/*', 'lib-ruby/**/*.rb', 'LICENSE']
  s.bindir        = 'bin-ruby'
  s.executables   = s.files.grep(%r{^bin-ruby/}) { |f| File.basename(f) }
  s.require_paths = ['lib-ruby']

  s.metadata = {
    'yard.run' => 'yard',
    'bug_tracker_uri' => 'https://github.com/acceis/aspisec/issues',
    'changelog_uri' => 'https://github.com/acceis/aspisec/blob/master/docs/CHANGELOG.md',
    'documentation_uri' => 'https://acceis.github.io/aspisec/',
    'homepage_uri' => 'https://acceis.github.io/aspisec/',
    'source_code_uri' => 'https://github.com/acceis/aspisec/',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.1.0', '< 4.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.3') # for colorized output
  s.add_runtime_dependency('xdg', '~> 8.0') # for XDG Base Directory resolution
end

# frozen_string_literal: true

require_relative 'lib-ruby/aspisec/version'

Gem::Specification.new do |s|
  s.name          = 'aspisec'
  s.version       = Aspisec::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'Removes the traces left by offensive security tools.'
  s.description   = 'Vacuuming out the remnants of offensive tools. AspiSec is responsible for removing the traces ' \
                    "and confidential information left by offensive security tools on an auditor's computer in " \
                    'various cache and log files.'
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

  s.add_runtime_dependency('activesupport', '~> 7.1', '>= 7.1.3.2') # for human-reabdle formater helper
  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('pastel', '~> 0.8') # for colorized output
  s.add_runtime_dependency('sxdg', '~> 1.0') # for XDG Base Directory resolution
  s.add_runtime_dependency('tty-logger', '~> 0.6') # for CLI event logging
  s.add_runtime_dependency('tty-prompt', '~> 0.23') # for input handling
end

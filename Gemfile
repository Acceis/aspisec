# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :runtime, :cli do
  gem 'docopt', '~> 0.6' # for argument parsing
  gem 'paint', '~> 2.3' # for colorized ouput
  gem 'xdg', '~> 8.0'
end

group :development, :install do
  gem 'bundler', '~> 2.5'
end

group :development, :test do
  # gem 'minitest', '~> 5.22'
  # gem 'rake', '~> 13.1'
end

group :development, :lint do
  gem 'rubocop', '~> 1.62'
  gem 'solargraph', '~> 0.50'
end

group :development, :docs do
  # Commonmarker 1.0 support https://github.com/lsegal/yard/issues/1528
  gem 'commonmarker', '~> 0.23' # for markdown support in YARD
  gem 'webrick', '~> 1.8' # web server for YARD
  gem 'yard', ['>= 0.9.27', '< 0.10'] # lib documentation
  gem 'yard-coderay', '~> 0.1' # for syntax highlight support in YARD
end

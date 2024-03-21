# frozen_string_literal: true

require 'aspisec/version'

require 'aspisec/config'
# require all modules
Dir[File.join(__dir__, 'aspisec', 'modules', '*.rb')].each { |f| require(f) }

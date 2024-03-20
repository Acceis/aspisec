# frozen_string_literal: true

require 'aspisec/version'

require 'aspisec/config'
# modules
Dir['aspisec/modules/*.rb'].each { |f| require(f) }

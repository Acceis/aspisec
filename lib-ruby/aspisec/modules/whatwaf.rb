# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # WhatWaf module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/Ekultek/WhatWaf
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Whatwaf module instance
    #   whw = Aspisec::Modules::Whatwaf.new(conf)
    #   # Locations available
    #   whw.locations_list # => ["database"]
    class Whatwaf < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :database

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'whatwaf', logger:)
        @database = Location.new(@conf, 'database')
        @locations_list = %w[database]
      end
    end
  end
end

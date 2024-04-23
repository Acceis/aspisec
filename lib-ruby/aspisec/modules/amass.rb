# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Amass module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/OWASP/Amass
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Amass module instance
    #   ama = Aspisec::Modules::Amass.new(conf)
    #   # Locations available
    #   ama.locations_list # => ["logs", "database"]
    class Amass < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :database

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'amass', logger:)
        @logs = Location.new(@conf, 'logs')
        @database = Location.new(@conf, 'database')
        @locations_list = %w[logs database]
      end
    end
  end
end

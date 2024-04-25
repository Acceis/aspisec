# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # dbgate module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/dbgate/dbgate
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Dbgate module instance
    #   dbg = Aspisec::Modules::Dbgate.new(conf)
    #   # Locations available
    #   dbg.locations_list # => ["connections", "logs"]
    class Dbgate < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :connections

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'dbgate', logger:)
        @connections = Location.new(@conf, 'connections')
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[connections logs]
      end
    end
  end
end

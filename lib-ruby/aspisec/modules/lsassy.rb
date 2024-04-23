# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # lsassy module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/Hackndo/lsassy
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Lsassy module instance
    #   lsa = Aspisec::Modules::Lsassy.new(conf)
    #   # Locations available
    #   lsa.locations_list # => ["masterkeys", "tickets"]
    class Lsassy < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :masterkeys

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :tickets

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'lsassy', logger:)
        @masterkeys = Location.new(@conf, 'masterkeys')
        @tickets = Location.new(@conf, 'tickets')
        @locations_list = %w[masterkeys tickets]
      end
    end
  end
end

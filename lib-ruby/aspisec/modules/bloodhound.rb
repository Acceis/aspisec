# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Bloodhound module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/BloodHoundAD/BloodHound
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Bloodhound module instance
    #   blh = Aspisec::Modules::Bloodhound.new(conf)
    #   # Locations available
    #   blh.locations_list # => ["database", "transactions"]
    class Bloodhound < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :database

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :transactions

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'bloodhound', logger:)
        @database = Location.new(@conf, 'database')
        @transactions = Location.new(@conf, 'transactions')
        @locations_list = %w[database transactions]
      end
    end
  end
end

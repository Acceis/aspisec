# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Metasploit module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/rapid7/metasploit-framework
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Metasploit module instance
    #   msf = Aspisec::Modules::Metasploit.new(conf)
    #   # Locations available
    #   msf.locations_list # => ["history", "logs", "loot", "meterpreter"]
    class Metasploit < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :history

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :loot

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :meterpreter

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf)
        super(conf, 'metasploit')
        @history = Location.new(@conf, 'history')
        @logs = Location.new(@conf, 'logs')
        @loot = Location.new(@conf, 'loot')
        @meterpreter = Location.new(@conf, 'meterpreter')
        @locations_list = %w[history logs loot meterpreter]
      end
    end
  end
end

# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # weevely module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/epinna/weevely3
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Weevely module instance
    #   wvl = Aspisec::Modules::Weevely.new(conf)
    #   # Locations available
    #   wvl.locations_list # => ["history", "sessions", "logs"]
    class Weevely < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :history

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :sessions

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'weevely', logger:)
        @history = Location.new(@conf, 'history')
        @sessions = Location.new(@conf, 'sessions')
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[history sessions logs]
      end
    end
  end
end

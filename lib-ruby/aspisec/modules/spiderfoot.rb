# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Spiderfoot module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/smicallef/spiderfoot
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Spiderfoot module instance
    #   spf = Aspisec::Modules::Spiderfoot.new(conf)
    #   # Locations available
    #   spf.locations_list # => ["database", "logs"]
    class Spiderfoot < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :database

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'spiderfoot', logger:)
        @database = Location.new(@conf, 'database')
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[database logs]
      end
    end
  end
end

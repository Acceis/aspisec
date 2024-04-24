# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Recaf module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/Col-E/Recaf
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Recaf module instance
    #   rec = Aspisec::Modules::Recaf.new(conf)
    #   # Locations available
    #   rec.locations_list # => ["classpath", "logs"]
    class Recaf < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :classpath

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'recaf', logger:)
        @classpath = Location.new(@conf, 'classpath')
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[classpath logs]
      end
    end
  end
end

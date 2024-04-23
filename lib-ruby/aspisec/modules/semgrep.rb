# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Semgrep module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/returntocorp/semgrep
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Semgrep module instance
    #   smg = Aspisec::Modules::Semgrep.new(conf)
    #   # Locations available
    #   smg.locations_list # => ["logs1", "logs2"]
    class Semgrep < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs1

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs2

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'semgrep', logger:)
        @logs1 = Location.new(@conf, 'logs1')
        @logs2 = Location.new(@conf, 'logs2')
        @locations_list = %w[logs1 logs2]
      end
    end
  end
end

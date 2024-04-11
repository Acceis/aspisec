# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # MANSPIDER module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/blacklanternsecurity/MANSPIDER
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Manspider module instance
    #   ms = Aspisec::Modules::Manspider.new(conf)
    #   # Locations available
    #   ms.locations_list # => ["logs", "loot"]
    class Manspider < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :loot

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'manspider', logger:)
        @logs = Location.new(@conf, 'logs')
        @loot = Location.new(@conf, 'loot')
        @locations_list = %w[logs loot]
      end
    end
  end
end

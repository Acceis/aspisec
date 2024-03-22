# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # theHarvester module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/laramies/theHarvester
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Theharvester module instance
    #   th = Aspisec::Modules::Theharvester.new(conf)
    #   # Locations available
    #   th.locations_list # => ["stash"]
    class Theharvester < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :stash

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'theharvester', logger:)
        @stash = Location.new(@conf, 'stash')
        @locations_list = %w[stash]
      end
    end
  end
end

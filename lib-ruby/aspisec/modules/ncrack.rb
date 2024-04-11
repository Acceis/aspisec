# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # ncrack module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/nmap/ncrack
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Ncrack module instance
    #   ncr = Aspisec::Modules::Ncrack.new(conf)
    #   # Locations available
    #   ncr.locations_list # => ["restore"]
    class Ncrack < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :restore

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'ncrack', logger:)
        @restore = Location.new(@conf, 'restore')
        @locations_list = %w[restore]
      end
    end
  end
end

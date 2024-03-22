# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # John (the Ripper) module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/openwall/john
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a John module instance
    #   john = Aspisec::Modules::John.new(conf)
    #   # Locations available
    #   john.locations_list # => ["logs", "potfile"]
    class John < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :potfile

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'john', logger:)
        @logs = Location.new(@conf, 'logs')
        @potfile = Location.new(@conf, 'potfile')
        @locations_list = %w[logs potfile]
      end
    end
  end
end

# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Remmina module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://remmina.org
    # @see https://gitlab.com/Remmina/Remmina
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Remmina module instance
    #   rem = Aspisec::Modules::Remmina.new(conf)
    #   # Locations available
    #   rem.locations_list # => ["configs"]
    class Remmina < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :configs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'remmina', logger:)
        @configs = Location.new(@conf, 'configs')
        @locations_list = %w[configs]
      end
    end
  end
end

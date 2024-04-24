# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # ffuf module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/ffuf/ffuf
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Ffuf module instance
    #   ffu = Aspisec::Modules::Ffuf.new(conf)
    #   # Locations available
    #   ffu.locations_list # => ["history"]
    class Ffuf < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :history

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'ffuf', logger:)
        @history = Location.new(@conf, 'history')
        @locations_list = %w[history]
      end
    end
  end
end

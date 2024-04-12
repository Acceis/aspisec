# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # MongoDB Compass module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://www.mongodb.com/products/tools/compass
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a MongodbCompass module instance
    #   mdc = Aspisec::Modules::MongodbCompass.new(conf)
    #   # Locations available
    #   mdc.locations_list # => ["logs"]
    class MongodbCompass < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'mongodb-compass', logger:)
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[logs]
      end
    end
  end
end

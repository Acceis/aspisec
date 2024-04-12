# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # MongoDB Shell (mongosh) module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://www.mongodb.com/docs/mongodb-shell/
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a MongodbMongosh module instance
    #   msh = Aspisec::Modules::MongodbMongosh.new(conf)
    #   # Locations available
    #   msh.locations_list # => ["logs", "history"]
    class MongodbMongosh < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :history

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'mongodb-mongosh', logger:)
        @logs = Location.new(@conf, 'logs')
        @history = Location.new(@conf, 'history')
        @locations_list = %w[logs history]
      end
    end
  end
end

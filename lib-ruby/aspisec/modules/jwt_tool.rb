# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # jwt_tool module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/ticarpi/jwt_tool
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a JwtTool module instance
    #   jwt = Aspisec::Modules::JwtTool.new(conf)
    #   # Locations available
    #   jwt.locations_list # => ["logs"]
    class JwtTool < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'jwt_tool', logger:)
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[logs]
      end
    end
  end
end

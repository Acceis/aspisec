# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # NetExec module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/Pennyw0rth/NetExec
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Netexec module instance
    #   nxc = Aspisec::Modules::Netexec.new(conf)
    #   # Locations available
    #   nxc.locations_list # => ["logs", "screenshots", "workspaces"]
    class Netexec < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :screenshots

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :workspaces

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'netexec', logger:)
        @logs = Location.new(@conf, 'logs')
        @screenshots = Location.new(@conf, 'screenshots')
        @workspaces = Location.new(@conf, 'workspaces')
        @locations_list = %w[logs screenshots workspaces]
      end
    end
  end
end

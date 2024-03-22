# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # CrackMapExec module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/byt3bl33d3r/CrackMapExec
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Crackmapexec module instance
    #   cme = Aspisec::Modules::Crackmapexec.new(conf)
    #   # Locations available
    #   cme.locations_list # => ["logs", "screenshots", "workspaces"]
    class Crackmapexec < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :screenshots

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :workspaces

      # Inherits from {Aspisec::Module} but without the `tool_name` argument
      # because it is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'crackmapexec', logger:)
        @logs = Location.new(@conf, 'logs')
        @screenshots = Location.new(@conf, 'screenshots')
        @workspaces = Location.new(@conf, 'workspaces')
        @locations_list = %w[logs screenshots workspaces]
      end
    end
  end
end

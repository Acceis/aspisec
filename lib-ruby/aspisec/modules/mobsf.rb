# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # MobSF module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://mobsf.github.io/docs/
    # @see https://github.com/MobSF/Mobile-Security-Framework-MobSF
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Mobsf module instance
    #   mob = Aspisec::Modules::Mobsf.new(conf)
    #   # Locations available
    #   mob.locations_list # => ["logs", "downloads", "uploads", "database"]
    class Mobsf < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :downloads

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :uploads

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :database

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'mobsf', logger:)
        @logs = Location.new(@conf, 'logs')
        @downloads = Location.new(@conf, 'downloads')
        @uploads = Location.new(@conf, 'uploads')
        @database = Location.new(@conf, 'database')
        @locations_list = %w[logs downloads uploads database]
      end
    end
  end
end

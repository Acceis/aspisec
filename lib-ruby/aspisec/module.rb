# frozen_string_literal: true

# stdlib
require 'pathname'
# third-party
require 'tty-logger'

module Aspisec
  # Generic module class that will be inherited in all modules instances
  class Module
    # The configuration for the tool.
    # Sub-tree under `tools > tool_name` of {Aspisec::Config#conf}.
    # @return [Hash]
    attr_reader :conf

    # The name of the tool.
    # @return [String] tool name
    attr_reader :name

    # List of locations (name).
    # Returns something only on module instances like {Aspisec::Modules::Sqlmap}.
    # Will be empty for {Aspisec::Module}.
    # For a list of objects, rather use {locations}.
    # @return [Array<String>]
    attr_reader :locations_list

    # The base location (directory) where the tool data is stored.
    # @return [Pathname] file path
    attr_reader :base

    # Not meant to be used directly but to be inherited in modules instead
    # @param conf [Aspisec::Config] an instance of the global configuration
    # @param tool_name [String] The name of the tool. It must match the configuration key.
    # @param logger [TTY::Logger] logger instance. See {Aspisec::Logger}.
    #   If none is provided, a default logger with log level 2 is created.
    #   See {Aspisec::Logger::LOG_LEVEL}.
    # @example
    #   conf = Aspisec::Config.new.conf
    #   # you should never do that as you'll get incomplete data and features
    #   sqlmap = Aspisec::Module.new(conf, 'sqlmap')
    #   # rather call the sqlmap module that will inherit this class
    #   sqlmap = Aspisec::Modules::Sqlmap.new(conf)
    def initialize(conf, tool_name, logger: nil)
      @logger = logger || Aspisec::Logger.new.logger
      @name = tool_name
      @logger.debug("Module #{@name} was loaded", app: @name)
      @conf = conf['tools'][tool_name]
      @base = Pathname.new(@conf.dig('location', 'base'))
      @enabled = @conf.fetch('enabled', true)
      @locations_list = []
    end

    # Is this module enabled?
    # @return [true|false]
    def enabled?
      @enabled
    end

    # Returns all locations available for the tool.
    # It returns a list {Location} objects unline {locations_list} that returns
    # only strings (location names).
    # @return [Array<Location>]
    def locations
      # Re-compute what's already cumputed and stored in properties
      # @locations_list.map { |loc| Location.new(@conf, loc) }
      # Access properties rather than re-computing
      # Using send() is safe here because the input is a hadrcaoded whitelist
      @locations_list.map { |loc| send(loc) }
    end

    # Object easing the manipulation of locations.
    # Helpers to get the path, check if this feature/file/directory is enabled, etc.
    class Location
      # Name of the feature, file or directory of the tool.
      # @return [String]
      attr_reader :name

      # File path of the file or directory location to clean.
      # @return [Pathname] absolute path
      attr_reader :path

      # Explanation of what the location (file / directory) is containing, to give an idea of how sensitive it is.
      # @return [String] description
      attr_reader :description

      # @param tool_conf [Hash] Tool configuration as returned by {Aspisec::Module#conf}.
      # @param feature_name [String] Name of the feature/file/directory to clean. Must be equal to the configuration key.
      def initialize(tool_conf, feature_name)
        @name = feature_name
        @path = Pathname.new(tool_conf.dig('location', @name, 'path'))
        @enabled = tool_conf.dig('location', @name).fetch('enabled', true)
        @description = tool_conf.dig('location', @name).fetch('description', '')
      end

      # Is this location enabled?
      # @return [true|false]
      def enabled?
        @enabled
      end
    end
  end
end

# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # HashCat module.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @see https://github.com/hashcat/hashcat
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Hashcat module instance
    #   hc = Aspisec::Modules::Hashcat.new(conf)
    #   # Locations available
    #   hc.locations_list # => ["sessions", "potfile", "dict_cache"]
    class Hashcat < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :sessions

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :potfile

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :dict_cache

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf)
        super(conf, 'hashcat')
        @sessions = Location.new(@conf, 'sessions')
        @potfile = Location.new(@conf, 'potfile')
        @dict_cache = Location.new(@conf, 'dict_cache')
        @locations_list = %w[sessions potfile dict_cache]
      end
    end
  end
end

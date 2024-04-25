# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Module for various history files stored in the user home directory.
    # Inherits {Aspisec::Module}.
    # For more examples of methods, see {Aspisec::Modules::Sqlmap}.
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a HomeHistoryFiles module instance
    #   hhf = Aspisec::Modules::HomeHistoryFiles.new(conf)
    #   # Locations available
    #   hhf.locations_list # => ["python", "postgresql", "ruby_irb", "ruby_rdbg", "redis_cli", "bash", "zsh", "zsh_alt"]
    class HomeHistoryFiles < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :python

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :postgresql

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :ruby_irb

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :ruby_rdbg

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :redis_cli

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :bash

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :zsh

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :zsh_alt

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf, logger: nil)
        super(conf, 'home-history-files', logger:)
        @python = Location.new(@conf, 'python')
        @postgresql = Location.new(@conf, 'postgresql')
        @ruby_irb = Location.new(@conf, 'ruby-irb')
        @ruby_rdbg = Location.new(@conf, 'ruby-rdbg')
        @redis_cli = Location.new(@conf, 'redis-cli')
        @bash = Location.new(@conf, 'bash')
        @zsh = Location.new(@conf, 'zsh')
        @zsh_alt = Location.new(@conf, 'zsh-alt')
        @locations_list = %w[python postgresql ruby_irb ruby_rdbg redis_cli bash zsh zsh_alt]
      end
    end
  end
end

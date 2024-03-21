# frozen_string_literal: true

require 'aspisec/module'

module Aspisec
  module Modules
    # Sqlmap module.
    # Inherits {Aspisec::Module}.
    # @see https://github.com/sqlmapproject/sqlmap
    # @example
    #   # Get the global config
    #   conf = Aspisec::Config.new.conf
    #   # Create a Sqlmap module instance
    #   sqlmap = Aspisec::Modules::Sqlmap.new(conf)
    #   # Generic methods
    #   sqlmap.name # => "sqlmap"
    #   sqlmap.conf # => {…}
    #   sqlmap.enabled? # => true
    #   sqlmap.base # => #<Pathname:/home/noraj/.local/share/sqlmap>
    #   sqlmap.locations_list # => ["history", "logs"]
    #   sqlmap.locations # => [#<Aspisec::Module::Location …>, … ]
    #   # Custom methods for the feature/file/folder location of Sqlmap to clean
    #   sqlmap.history # => #<Aspisec::Module::Location …>
    #   sqlmap.logs # => #<Aspisec::Module::Location …>
    #   # But those custom locations benefits of generic methods
    #   sqlmap.history.enabled? # => true
    #   sqlmap.history.name # => => "history"
    #   sqlmap.history.description # => "Directory containing…"
    #   sqlmap.history.path => #<Pathname:/home/noraj/.local/share/sqlmap/history>
    #   # Since `.path` returns a {Pathname} object, we can use generic {File},
    #   # {FileTest} methods and some from {Dir} and {FileUtils} as well.
    #   sqlmap.history.path.exist? # => true
    #   sqlmap.history.path.file? # => false
    #   sqlmap.history.path.directory? # => true
    #   sqlmap.history.path.readable? # => true
    #   sqlmap.history.path.children # => [#<Pathname:/home/noraj/.local/share/sqlmap/history/os.hst>, #<Pathname:…>]
    #   sqlmap.history.path.children.first.size # => 10
    class Sqlmap < Aspisec::Module
      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :history

      # see {Aspisec::Config::DEFAULT_CONFIG} or call {Aspisec::Module::Location#description}.
      # @return [Location]
      attr_reader :logs

      # Inherits from {Aspisec::Module} but has only the `conf` argument,
      # `tool_name` is hardcoded for each module.
      # @param conf [Aspisec::Config] an instance of the global configuration
      def initialize(conf)
        super(conf, 'sqlmap')
        @history = Location.new(@conf, 'history')
        @logs = Location.new(@conf, 'logs')
        @locations_list = %w[history logs]
      end
    end
  end
end

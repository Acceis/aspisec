# frozen_string_literal: true

require 'pastel'
require 'tty-prompt'

# ActiveSupport minimal load (we only use number_to_human_size)
require 'active_support'
require 'active_support/core_ext/numeric/conversions'

module Aspisec
  # Manage the cleaning operations
  class Clean
    # @param conf [Aspisec::Config] an instance of the global configuration
    #   If none is provided, the default config is loaded.
    # @param logger [TTY::Logger] logger instance. See {Aspisec::Logger}.
    #   If none is provided, a default logger with log level 2 is created.
    #   See {Aspisec::Logger::LOG_LEVEL}.
    def initialize(conf: nil, logger: nil)
      @logger = logger || Aspisec::Logger.new.logger
      @conf = conf || Aspisec::Config.new(@logger).conf
      @modules = Aspisec::Modules.modules(conf:, logger:).select(&:enabled?)
      @autoclean = @conf.dig('aspisec', 'autoclean').fetch('enabled', false)
      @describe = @conf.dig('aspisec', 'describe').fetch('enabled', true)
      @prompt = TTY::Prompt.new
      @painter = Pastel.new(eachline: "\n")
    end

    # Display location (file or directory) information and prompt user for deletion
    # It will follow the configuration wether it has to display the description or not.
    # @param location [Aspisec::Module::Location]
    # @return [true|false]
    def prompt_removal(location:)
      puts "——— #{@painter.decorate(location.name, :cyan, :bold)} ———"
      puts_decorated('Path', location.path.to_s)
      puts_decorated('Type', file_type(location.path))
      puts_decorated('Size', type_size(location.path))
      puts_decorated('Description', location.description) if @describe
      @prompt.yes?("Do you want to remove #{location.name}?")
    end

    # Display decorated key/value
    # @param key [String]
    # @param value [String]
    # @return [nil]
    def puts_decorated(key, value)
      puts @painter.decorate("#{key}: ", :bright_blue, :bold) + value
    end

    # Type of file
    # @param path [Pathname]
    # @return [String] `file`, `directory` or `other`
    def file_type(path)
      if path.file?
        'file'
      elsif path.directory?
        'directory'
      else
        'other'
      end
    end

    # Formats number as bytes into a human-friendly representation.
    # @param size [Integer] file size in bytes
    # @return [String] human-friendly size with the most suitable unit
    # @see https://api.rubyonrails.org/classes/ActiveSupport/NumberHelper.html#method-i-number_to_human_size
    def human_size(size)
      ActiveSupport::NumberHelper.number_to_human_size(size)
    end

    # Calculate directory size (size of all files stored in it).
    # It will be the real size of files not the size on disk.
    # It ignores anything else than files so it could be wrong for symlinks, mounts, etc.
    # It also don't take into consideration the size of the directory itself.
    # @param path [Pathname]
    # @return [Integer] size in bytes
    def directory_size(path)
      Dir[File.join(path, '**', '*')].select { |f| File.file?(f) }.sum { |f| File.size(f) }
    end

    # Displays the size (in human-friendly format with {human_size}) regardless of whether it is a file or a directory.
    # @param path [Pathname]
    # @return [String] human-friendly size with the most suitable unit, or `empty` is the size is zero
    def type_size(path)
      size = if path.directory?
               directory_size(path)
             else
               path.size
             end
      size.zero? ? 'empty' : human_size(size)
    end

    # Delete the location regardless of whether it is a file or a directory.
    # @param path [Pathname]
    # @return [nil]
    def type_delete(path)
      if path.directory?
        path.rmtree
      else
        path.delete
      end
      nil
    end

    # Handles and logs deletion of locations
    # @param path [Pathname]
    # @return [nil]
    def delete_location(path)
      type_delete(path)
      @logger.info("#{path} was removed")
      nil
    end

    # Handles the deletion mode. It could be automatic or manual cleaning.
    # @param loc [Aspisec::Module::Location]
    def delete_mode(loc)
      return unless loc.enabled?

      if @autoclean
        delete_location(loc.path)
      else
        manual_delete(loc)
      end
    end

    # Handles the manual deletion mode.
    # @param loc [Aspisec::Module::Location]
    def manual_delete(loc)
      remove = prompt_removal(location: loc)
      if remove
        delete_location(loc.path)
      else
        @logger.debug("#{loc.path} was left untouched")
      end
    end

    # Main method, handling the cleaning.
    # Only enabled modules and locations will be removed.
    # Works either with auto-cleaning or ask for manual confirmation.
    # @return [nil]
    def clean
      @modules.each do |mod|
        next unless mod.enabled?

        puts "━━━━━━━━━━━━ #{@painter.decorate(mod.name, :white, :bold, :on_blue)} ━━━━━━━━━━━━"
        mod.locations.each do |loc|
          delete_mode(loc)
        end
      end
      nil
    end
  end
end

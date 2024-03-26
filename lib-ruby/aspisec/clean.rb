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

    # @param location [Aspisec::Module::Location]
    # @return [true|false]
    def prompt_removal(location:)
      puts "——— #{@painter.decorate(location.name, :cyan, :bold)} ———"
      puts @painter.decorate('Path: ', :bright_blue, :bold) + location.path.to_s
      puts @painter.decorate('Type: ', :bright_blue, :bold) + file_type(location.path)
      puts @painter.decorate('Size: ', :bright_blue, :bold) + type_size(location.path)
      puts @painter.decorate('Description: ', :bright_blue, :bold) + location.description if @describe
      @prompt.yes?("Do you want to remove #{location.name}?")
    end

    # @param path [Pathname]
    # @return [String]
    def file_type(path)
      if path.file?
        'file'
      elsif path.directory?
        'directory'
      else
        'other'
      end
    end

    def human_size(size)
      ActiveSupport::NumberHelper.number_to_human_size(size)
    end

    # Real size not size on disk + ignore anything else than files so it could be wrong for symlinks, mounts, etc.
    def directory_size(path)
      Dir[File.join(path, '**', '*')].select { |f| File.file?(f) }.sum { |f| File.size(f) }
    end

    def type_size(path)
      size = if path.directory?
               directory_size(path)
             else
               path.size
             end
      size.zero? ? 'empty' : human_size(size)
    end

    def clean
      @modules.each do |mod|
        next unless mod.enabled?

        puts "━━━━━━━━━━━━ #{@painter.decorate(mod.name, :white, :bold, :on_blue)} ━━━━━━━━━━━━"
        mod.locations.each do |loc|
          if loc.enabled?
            if @autoclean
              @logger.info("#{loc.path} was removed")
              puts "TODO rm #{loc.path}"
            else
              remove = prompt_removal(location: loc)
              if remove
                @logger.info("#{loc.path} was removed")
                puts "TODO rm #{loc.path}"
              else
                @logger.debug("#{loc.path} was left untouched")
                puts 'TODO Okayyyyyyyy'
              end
            end
          end
        end
      end
      nil
    end
  end
end

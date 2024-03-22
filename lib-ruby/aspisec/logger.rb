# frozen_string_literal: true

require 'tty-logger'

module Aspisec
  # CLI / Terminal / console information logging
  class Logger
    # Mapping integers to log levels from tty-logger (https://github.com/piotrmurach/tty-logger?tab=readme-ov-file#22-levels)
    LOG_LEVEL = {
      0 => :debug,
      1 => :info,
      2 => :warn,
      3 => :error,
      4 => :fatal
    }.freeze

    # The configuration of the logger
    # @return [TTY::Logger]
    attr_reader :logger

    # @param log_level [Integer] Default is 2. See {LOG_LEVEL}.
    # @example
    #   logger = Aspisec::Logger.new(0).logger
    #   conf = Aspisec::Config.new(logger)
    def initialize(log_level = 2)
      @logger = TTY::Logger.new { |config| config.level = LOG_LEVEL[log_level] }
    end
  end
end

# frozen_string_literal: true

# require all modules
Dir[File.join(__dir__, 'modules', '*.rb')].each { |f| require(f) }

module Aspisec
  # This Ruby module contains all Aspisec modules.
  # Each Aspisec module is a Ruby class inherinting the Aspisec::Module base class.
  # The "Modules" module also contains methods to manage all Aspisec modules.
  module Modules
    # List all available Aspisec modules
    # @return [Array<Symbol>] list of symbolized module names
    # @example
    #   Aspisec::Modules.list_modules
    #   # => [:Netexec, :Sqlmap, :Hashcat, :Theharvester, :Crackmapexec, :John, :Metasploit]
    def self.list_modules
      Aspisec::Modules.constants.select { |c| Aspisec::Modules.const_get(c) <= Aspisec::Module }
    end

    # Intanciates all Aspisec modules
    # @param conf [Aspisec::Config] an instance of the global configuration
    #   If none is provided, the default config is loaded.
    # @param logger [TTY::Logger] logger instance. See {Aspisec::Logger}.
    #   If none is provided, a default logger with log level 2 is created.
    #   See {Aspisec::Logger::LOG_LEVEL}.
    # @return [Array<Aspisec::Module>]
    def self.modules(conf: nil, logger: nil)
      cnf = conf || Aspisec::Config.new(logger).conf
      list_modules.map { |c| Aspisec::Modules.const_get(c).new(cnf, logger:) }
    end
  end
end

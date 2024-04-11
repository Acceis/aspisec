# frozen_string_literal: true

# stdlib
require 'yaml'
# third-party
require 'sxdg'
require 'tty-logger'

module Aspisec
  # Managing the configuration file (location, creation, parsing)
  class Config
    CONFIG_FILENAME = 'aspisec.config.yaml'
    DEFAULT_CONFIG = {
      'aspisec' => {
        'version' => Aspisec::VERSION,
        # Auto clean, remove files without asking confirmation
        'autoclean' => {
          'enabled' => false
        },
        # Display the description of each location to explain what the file /
        # directory is storing
        'describe' => {
          'enabled' => true
        }
      },
      'tools' => {
        # Example of a tool configuration
        'example' => {
          # Putting this value to false allow to disable the check for this module only
          'enabled' => false,
          'location' => {
            # The base location where the tool stores the confidential stuff to clean
            # $XDG_DATA_HOME is evaluated with a XDG library so even if the environment
            # variable doesn't exist it will be replaced with the default standard value
            'base' => '$XDG_DATA_HOME/tools/ex',
            'logs' => {
              # Path to the confidential file n°1
              # <base> will be replaced by location.base value
              'path' => '<base>/output',
              # Each file check can be individually turned off rather than disabling the whole module
              'enaled' => false,
              # The description explain which client-related data is stored there and how it is sensitive.
              # It generally says if it's a file or directory.
              'description' => 'The directory containing log files. Logs contain IP addresses and hostnames.'
            }
          }
        },
        'sqlmap' => {
          'enabled' => true,
          'location' => {
            'base' => '$XDG_DATA_HOME/sqlmap', # ~/.local/share/sqlmap
            'history' => {
              'path' => '<base>/history',
              'description' => "Directory containing history files.\n" \
                               "os.hst stores system commands entered when using --os-pwn option.\n" \
                               'sql.hst stores SQL quries entered when using --os-shell option.'
            },
            'logs' => {
              'path' => '<base>/output',
              'description' => "Directory containing a folder per target.\n" \
                               "<target>/log contains all successful injection vectors.\n" \
                               "<target>/session.sqlite contains retrieved data.\n" \
                               '<target>/target.txt contains target URL + command used.'
            }
          }
        },
        'crackmapexec' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.cme', # ~/.cme
            'logs' => {
              'path' => '<base>/logs',
              'description' => 'Directory containing log files, secrets, hashes, cleartext passwords etc.'
            },
            'screenshots' => {
              'path' => '<base>/screenshots',
              'description' => 'Directory where are stored all screenshots taken with the --screenshot option.'
            },
            'workspaces' => {
              'path' => '<base>/workspaces',
              'description' => "Directory containing workspaces.\n" \
                               'Workspaces contain SQLite databases including users (domain, usernames, password), ' \
                               'shares, hosts, dpapi secrets, etc.'
            }
          }
        },
        'netexec' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.nxc', # ~/.nxc
            'logs' => {
              'path' => '<base>/logs',
              'description' => 'Directory containing log files, secrets, hashes, cleartext password etc.'
            },
            'screenshots' => {
              'path' => '<base>/screenshots',
              'description' => 'Directory where are stored all screenshots taken with the --screenshot option.'
            },
            'workspaces' => {
              'path' => '<base>/workspaces',
              'description' => "Directory containing workspaces.\n" \
                               'Workspaces contain SQLite databases including users (domain, usernames, password), ' \
                               'shares, hosts, dpapi secrets, etc.'
            }
          }
        },
        'hashcat' => {
          'enabled' => true,
          'location' => {
            'base' => '$XDG_DATA_HOME/hashcat', # ~/.local/share/hashcat
            'sessions' => {
              'path' => '<base>/sessions',
              'enaled' => false,
              'description' => "Directory containing session related data.\n" \
                               'hashcat.log should not contain any sensible data unless the file name ' \
                               "of a target file is sensible.\n" \
                               'show.log should not contain any sensible data unless the folder name is sensible.'
            },
            'potfile' => {
              'path' => '<base>/hashcat.potfile',
              'description' => "File containing all cracked hashes.\n" \
                               'Passwords may include enterprize related content or may be easily recognizable.'
            },
            'dict_cache' => {
              'path' => '<base>/hashcat.dictstat2',
              'enabled' => false,
              'description' => "File is a cache for dictionaries.\n" \
                               'It should not be sensible unless dict. contain confidential data.'
            }
          }
        },
        'theharvester' => {
          'enabled' => true,
          'location' => {
            'base' => '$XDG_DATA_HOME/theHarvester', # ~/.local/share/theHarvester
            #
            'stash' => {
              'path' => '<base>/stash.sqlite',
              'description' => 'File (SQLite DB) containing all the harvested addresses.'
            }
          }
        },
        'john' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.john', # ~/.john
            #
            #
            'logs' => {
              'path' => '<base>/john.log',
              'description' => "File containing the logs of the commands launched.\n" \
                               'Does not contain hashes or passwords but usernames and whole command lines.'
            },
            'potfile' => {
              'path' => '<base>/john.pot',
              'description' => "File containing all cracked hashes.\n" \
                               'Passwords may include enterprize related content or may be easily recognizable.'
            }
          }
        },
        'metasploit' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.msf4', # ~/.msf4
            #
            #
            'history' => {
              'path' => '<base>/history',
              'description' => "File containing the history of commands used in msf shell.\n" \
                               'It certainly contains username, passwords, hostnames, etc.'
            },
            'logs' => {
              'path' => '<base>/logs',
              'description' => "Directory containing log files.\n" \
                               "framework.log may contain stacktraces that contain payloads.\n" \
                               "production.log and sessions/ ? (I don't know, empty for me)"
            },
            'loot' => {
              'path' => '<base>/loot',
              'description' => "Directory containing looted files.\n" \
                               'Those are retrieved clients files.'
            },
            'meterpreter' => {
              'path' => '<base>/meterpreter_history',
              'description' => "File containing the history of commands used in meterpreter sessions.\n" \
                               "Less sensible than msf shell history but could still contains some file paths, \n" \
                               'for example.'
            }
          }
        },
        'jwt_tool' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.jwt_tool', # ~/.jwt_tool
            'logs' => {
              'path' => '<base>/logs.txt',
              'description' => "File containing the logs of the commands launched.\n" \
                               'Contains the JWT for all injections and tamper attemps.'
            }
          }
        },
        'manspider' => {
          'enabled' => true,
          'location' => {
            'base' => '$HOME/.manspider', # ~/.manspider
            'logs' => {
              'path' => '<base>/logs',
              'description' => "Directory containing log files.\n" \
                               'Log files contains commands with the password not redacted and the path of all ' \
                               'extracted files.'
            },
            'loot' => {
              'path' => '<base>/loot',
              'description' => "Directory containing looted files.\n" \
                               'Those are retrieved clients files.'
            }
          }
        }
      },
      'audit' => {
        'enabled' => false,
        'location' => {
          'base' => '$HOME/Projets'
        }
      }
    }.freeze

    # The parsed Aspisec configuration
    # @return [Hash] the Aspisec configuration object
    attr_reader :conf

    # Load config. or create a default config. file if not existing.
    # Also parse and interprete custom values.
    # @param logger [TTY::Logger] logger instance. See {Aspisec::Logger}.
    #   If none is provided, a default logger with log level 2 is created.
    #   See {Aspisec::Logger::LOG_LEVEL}.
    # @example
    #   # With default logger
    #   cnf = Aspisec::Config.new
    #   cnf.conf
    #   # With custom logger
    #   logger = Aspisec::Logger.new(0).logger
    #   cnf = Aspisec::Config.new(logger)
    #   cnf.conf
    def initialize(logger = nil)
      # Set log level
      @logger = logger || Aspisec::Logger.new.logger
      # Create the configuration file if it doesn't exist
      create_config unless config_exist?
      # Else load it
      @conf = load_config
      # Check the version of the configuration
      check_version
      # Replace the path variables / plaholders with real values
      expand_path_conf!
    end

    # Comparison between Aspisec tool version and Aspisec configuration version
    # @return [true|false] true when the tool and configuration version match
    def check_version
      version = @conf.dig('aspisec', 'version')
      matching = true
      if version.nil?
        @logger.warn('No version found in the configuration (old version).')
        matching = false
      elsif Gem::Version.new(Aspisec::VERSION) > Gem::Version.new(version)
        message = "The configuration is older (#{version}) than the tool (#{Aspisec::VERSION})." \
                  'Some module or features may be missing.'
        @logger.warn(message)
        matching = false
      elsif Gem::Version.new(Aspisec::VERSION) < Gem::Version.new(version)
        message = "The configuration is newer (#{version}) than the tool (#{Aspisec::VERSION})." \
                  'You may experience issues.'
        @logger.warn(message)
        matching = false
      end
      unless matching
        @logger.warn("\"rm #{config_filepath}\" if you want Aspisec to recreate a default configuration file")
      end
      matching
    end

    # Read and parse (YAML ➡️ Ruby Hash) the config. file
    # @return [Hash|nil] the corresponding Ruby object parsed from the YAML file
    #   or `nil` if the configuration file doesn't exist
    def load_config
      if config_exist?
        @logger.debug("Loading configuration from #{config_filepath}")
        YAML.load_file(config_filepath, symbolize_names: false)
      else
        @logger.warn('Configuration not loaded')
        nil
      end
    end

    # Create the configuration file with default value at default location if it doesn't already exist
    def create_config
      return if config_exist?

      parent_dir = File.dirname(config_filepath)
      # create parent folder recursively if it doesn't already exist
      FileUtils.mkpath(parent_dir)
      @logger.info("Creating configuration file: #{config_filepath}")
      File.write(config_filepath, YAML.dump(DEFAULT_CONFIG))
    end

    # Get the Aspisec configuration file path
    # @return [String] absolute file path
    def config_filepath
      File.join(SXDG::XDG_CONFIG_HOME, 'aspisec', CONFIG_FILENAME) # /home/noraj/.config/aspisec/aspisec.config.yaml
    end

    # Check if the Aspisec configuration file exists or not
    # @return [true|false]
    def config_exist?
      # Logging this floods debug info and is not meaningful
      # exist = File.exist?(config_filepath)
      # neg = exist ? '' : 'does not'
      # @logger.debug("The configuration file #{config_filepath} #{neg} exist")
      # exist
      File.exist?(config_filepath)
    end

    # @note see {Aspisec::Config.expand_path_variables}
    def expand_path_variables(path)
      Config.expand_path_variables(path)
    end

    # Evaluate XDG variables and $HOME in file path
    # @param path [String] path with variables
    # @return [String] the absolute version of the evaluated path
    # @note Arguments other than Strings are returned untouched, useful to iterate over configuration values
    # @example
    #   conf.expand_path_variables('$XDG_DATA_HOME/sqlmap')
    #   # => "/home/noraj/.local/share/sqlmap"
    def self.expand_path_variables(path)
      return path unless path.is_a?(String) # not a path, let untouched

      case path
      when /\$XDG_CONFIG_HOME/
        path.sub!('$XDG_CONFIG_HOME', SXDG::XDG_CONFIG_HOME)
      when /\$XDG_DATA_HOME/
        path.sub!('$XDG_DATA_HOME', SXDG::XDG_DATA_HOME)
      when /\$HOME/
        path.sub!('$HOME', Dir.home)
      end
      File.expand_path(path)
    end

    # Expand all base location with {Aspisec::Config.expand_path_variables} in the configuration
    # + expand the custom `<base>` tags
    def expand_path_conf!
      @conf['tools'].each_key do |tool|
        base_path = @conf.dig('tools', tool, 'location', 'base')
        @conf['tools'][tool]['location']['base'] = expand_path_variables(base_path)
        @conf['tools'][tool]['location'].each_key do |k|
          unless k == 'base'
            feature_path = @conf.dig('tools', tool, 'location', k, 'path')
            @conf['tools'][tool]['location'][k]['path'] = feature_path.sub('<base>', base_path) if feature_path
          end
        end
      end
      @conf['audit']['location']['base'] = expand_path_variables(@conf.dig('audit', 'location', 'base'))
      @conf
    end
  end
end

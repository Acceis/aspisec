# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      HOME_HISTORY_FILES = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME', # ~/
          'python' => {
            'path' => '<base>/.python_history',
            'description' => "Python history file.\n" \
                             'Contains all commands entered in the Python REPL.'
          },
          'postgresql' => {
            'path' => '<base>/.psql_history',
            'description' => "PostgreSQL history file.\n" \
                             'Contains all commands entered in the PostegreSQL shell.'
          },
          'ruby-irb' => {
            'path' => '<base>/.irb_history',
            'description' => "Ruby (IRB) hitory file.\n" \
                             'Contains all commands entered in the Ruby REPL.'
          },
          'ruby-rdbg' => {
            'path' => '<base>/.rdbg_history',
            'description' => "Ruby (rdbg) hitory file.\n" \
                             'Contains all commands entered in the Ruby debugger.'
          },
          'redis-cli' => {
            'path' => '<base>/.rediscli_history',
            'description' => "Redis CLI history file.\n" \
                             'Contains all commands entered in the redis-cli shell.'
          },
          'bash' => {
            'enabled' => false,
            'path' => '<base>/.bash_history',
            'description' => "Bash history file.\n" \
                             'Contains all commands entered in the Bash shell.'
          },
          'zsh' => {
            'enabled' => false,
            'path' => '<base>/.zsh_history',
            'description' => "Zsh history file.\n" \
                             'Contains all commands entered in the Zsh shell.'
          },
          'zsh-alt' => {
            'enabled' => false,
            'path' => '<base>/.histfile',
            'description' => "Zsh history file.\n" \
                             "Contains all commands entered in the Zsh shell.\n" \
                             'Alternative Zsh history file location set by zsh-newuser-install in HISTFILE ' \
                             'environment variable.'
          }
        }
      }.freeze
    end
  end
end

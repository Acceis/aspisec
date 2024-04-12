# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      MONGODB_MONGOSH = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.mongodb/mongosh', # ~/.mongodb/mongosh
          'logs' => {
            'path' => '<base>/*_log',
            'description' => "Log files.\n" \
                             'Contain at least information about target (IP, port).'
          },
          'history' => {
            'path' => '<base>/mongosh_repl_history',
            'description' => "History file.\n" \
                             'Contain the history of commands typed in mongosh shell.'
          }
        }
      }.freeze
    end
  end
end

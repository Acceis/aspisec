# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      WEEVELY = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.weevely', # ~/.weevely
          'history' => {
            'path' => '<base>/history',
            'description' => 'File containing the history of the commands typed on webshells.'
          },
          'sessions' => {
            'path' => '<base>/sessions',
            'description' => "Directory containing session files.\n" \
                             'Session files contain URL to webshell, webshell password, extension results, etc.'
          },
          'logs' => {
            'path' => '<base>/weevely.log*',
            'description' => "Files containing the logs.\n" \
                             "A log file contains the response to commands executed on the remote machine.\n" \
                             'As there is a rotation, mutiple log files may exist. The last will be weevely.log ' \
                             'then the older ones will follow the pattern weevely.log.<number> e.g. weevely.log.1 ' \
                             'etc.'
          }
        }
      }.freeze
    end
  end
end

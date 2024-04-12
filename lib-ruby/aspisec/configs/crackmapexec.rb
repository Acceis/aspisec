# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      CRACKMAPEXEC = {
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
      }.freeze
    end
  end
end

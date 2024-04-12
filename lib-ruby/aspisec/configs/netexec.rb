# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      NETEXEC = {
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
      }.freeze
    end
  end
end

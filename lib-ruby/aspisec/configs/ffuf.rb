# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      FFUF = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_CONFIG_HOME/ffuf', # ~/.config/ffuf
          'history' => {
            'path' => '<base>/history',
            'description' => "Folder containing the history of command options used.\n" \
                             'Those files contain target URL but may also contains secrets in headers.'
          }
        }
      }.freeze
    end
  end
end

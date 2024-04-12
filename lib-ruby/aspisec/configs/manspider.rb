# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      MANSPIDER = {
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
      }.freeze
    end
  end
end

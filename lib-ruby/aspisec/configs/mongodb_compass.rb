# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      MONGODB_COMPASS = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.mongodb/compass', # ~/.mongodb/compass
          'logs' => {
            'path' => '<base>/*_log.gz',
            'description' => "Compressed log files.\n" \
                             'Credentials are redacted but logs still contain IP and port.'
          }
        }
      }.freeze
    end
  end
end

# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      SPIDERFOOT = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.spiderfoot', # ~/.spiderfoot
          'database' => {
            'path' => '<base>/spiderfoot.db',
            'description' => "Database file.\n" \
                             'It contains target domains in logs and results.'
          },
          'logs' => {
            'path' => '<base>/logs',
            'description' => "Directory containing debug and errors logs.\n" \
                             'Logs contain IP addresses of targets.'
          }
        }
      }.freeze
    end
  end
end

# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      AMASS = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_CONFIG_HOME/amass', # ~/.config/amass
          'logs' => {
            'path' => '<base>/amass.log',
            'description' => 'Log file containing the searched domain.'
          },
          'database' => {
            'path' => '<base>/amass.sqlite',
            'description' => "Database file.\nContains search results."
          }
        }
      }.freeze
    end
  end
end

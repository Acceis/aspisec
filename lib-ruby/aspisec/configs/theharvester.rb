# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      THEHARVESTER = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_DATA_HOME/theHarvester', # ~/.local/share/theHarvester
          #
          'stash' => {
            'path' => '<base>/stash.sqlite',
            'description' => 'File (SQLite DB) containing all the harvested addresses.'
          }
        }
      }.freeze
    end
  end
end

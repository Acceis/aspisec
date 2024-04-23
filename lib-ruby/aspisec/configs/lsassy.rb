# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      LSASSY = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_CONFIG_HOME/lsassy', # ~/.config/lsassy
          'masterkeys' => {
            'path' => '<base>/masterkeys.txt',
            'description' => 'File containing master keys retreived from targets.'
          },
          'tickets' => {
            'path' => '<base>/tickets',
            'description' => 'Folder containing dumped tickets (TGT, TGS) from targets.'
          }
        }
      }.freeze
    end
  end
end

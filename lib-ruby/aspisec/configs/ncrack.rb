# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      NCRACK = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.ncrack', # ~/.ncrack
          'restore' => {
            'path' => '<base>',
            'description' => "Directory containing retore files to resume a cracking session.\n" \
                             'Restore files contain the command launch including the username or wordlist used.'
          }
        }
      }.freeze
    end
  end
end

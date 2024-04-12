# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      REMMINA = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_DATA_HOME/remmina', # ~/.local/share/remmina/
          'configs' => {
            'enabled' => false,
            'path' => '<base>/*.remmina',
            'description' => "Configuration files for saved targets.\n" \
                             'It could contain usernames, passwords, IP addresses, target name.'
          }
        }
      }.freeze
    end
  end
end

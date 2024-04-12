# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      HASHCAT = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_DATA_HOME/hashcat', # ~/.local/share/hashcat
          'sessions' => {
            'path' => '<base>/sessions',
            'enaled' => false,
            'description' => "Directory containing session related data.\n" \
                             'hashcat.log should not contain any sensible data unless the file name ' \
                             "of a target file is sensible.\n" \
                             'show.log should not contain any sensible data unless the folder name is sensible.'
          },
          'potfile' => {
            'path' => '<base>/hashcat.potfile',
            'description' => "File containing all cracked hashes.\n" \
                             'Passwords may include enterprize related content or may be easily recognizable.'
          },
          'dict_cache' => {
            'path' => '<base>/hashcat.dictstat2',
            'enabled' => false,
            'description' => "File is a cache for dictionaries.\n" \
                             'It should not be sensible unless dict. contain confidential data.'
          }
        }
      }.freeze
    end
  end
end

# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      JOHN = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.john', # ~/.john
          'logs' => {
            'path' => '<base>/john.log',
            'description' => "File containing the logs of the commands launched.\n" \
                             'Does not contain hashes or passwords but usernames and whole command lines.'
          },
          'potfile' => {
            'path' => '<base>/john.pot',
            'description' => "File containing all cracked hashes.\n" \
                             'Passwords may include enterprize related content or may be easily recognizable.'
          }
        }
      }.freeze
    end
  end
end

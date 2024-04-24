# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      RECAF = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_CONFIG_HOME/Recaf', # ~/.config/Recaf
          'classpath' => {
            'path' => '<base>/classpath',
            'description' => "Folder containing JARs.\n" \
                             'Those JARs contain the classpath of previously openned JARs.'
          },
          'logs' => {
            'path' => '<base>/rclog.txt',
            'description' => "Log file of the last session.\n" \
                             'Contains class names, file names or commands if openned in CLI mode.'
          }
        }
      }.freeze
    end
  end
end

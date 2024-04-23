# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      SEMGREP = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.semgrep', # ~/.semgrep
          'logs1' => {
            'path' => '<base>/last.log',
            'description' => 'Logs files containing project path.'
          },
          'logs2' => {
            'path' => '<base>/semgrep.log',
            'description' => 'Logs files containing project path.'
          }
        }
      }.freeze
    end
  end
end

# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      JWT_TOOL = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.jwt_tool', # ~/.jwt_tool
          'logs' => {
            'path' => '<base>/logs.txt',
            'description' => "File containing the logs of the commands launched.\n" \
                             'Contains the JWT for all injections and tamper attemps.'
          }
        }
      }.freeze
    end
  end
end

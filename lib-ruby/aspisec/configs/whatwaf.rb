# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      WHATWAF = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.whatwaf', # ~/.whatwaf
          'database' => {
            'path' => '<base>/whatwaf.sqlite',
            'description' => 'File (database) containing cached payloads and URLs.'
          }
        }
      }.freeze
    end
  end
end

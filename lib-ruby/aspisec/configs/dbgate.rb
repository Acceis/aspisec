# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      DBGATE = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.dbgate', # ~/.dbgate
          'connections' => {
            'enabled' => false,
            'path' => '<base>/connections.jsonl',
            'description' => "File containing connection shortchuts.\n" \
                             'Connection objects contain target domain or IP address.'
          },
          'logs' => {
            'path' => '<base>/logs',
            'description' => "Logs folder.\n" \
                             "Those log events shouldn't contain customer information but who knows."
          }
        }
      }.freeze
    end
  end
end

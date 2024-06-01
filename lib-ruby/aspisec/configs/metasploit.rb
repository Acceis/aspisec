# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      METASPLOIT = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.msf4', # ~/.msf4
          'history' => {
            'path' => '<base>/history',
            'description' => "File containing the history of commands used in msf shell.\n" \
                             'It certainly contains username, passwords, hostnames, etc.'
          },
          'logs' => {
            'path' => '<base>/logs',
            'description' => "Directory containing log files.\n" \
                             "framework.log may contain stacktraces that contain payloads.\n" \
                             "production.log and sessions/ ? (I don't know, empty for me)"
          },
          'loot' => {
            'path' => '<base>/loot',
            'description' => "Directory containing looted files.\n" \
                             'Those are retrieved clients files.'
          },
          'meterpreter' => {
            'path' => '<base>/meterpreter_history',
            'description' => "File containing the history of commands used in meterpreter sessions.\n" \
                             "Less sensible than msf shell history but could still contains some file paths, \n" \
                             'for example.'
          }
        }
      }.freeze
    end
  end
end

# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      MOBSF = {
        'enabled' => true,
        'location' => {
          'base' => '$HOME/.MobSF', # ~/.MobSF
          'logs' => {
            'path' => '<base>/debug.log',
            'description' => 'Logs file containing at least APK name.'
          },
          'downloads' => {
            'path' => '<base>/downloads',
            'description' => 'Directory where are stored files extracted from APK or screenshots of the app running.'
          },
          'uploads' => {
            'path' => '<base>/uploads',
            'description' => "Directory containing decompressed APKs."
          },
          'database' => {
            'path' => '<base>/db.sqlite3',
            'description' => "Database file containing at least APK name."
          }
        }
      }.freeze
    end
  end
end

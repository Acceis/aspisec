# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      SQLMAP = {
        'enabled' => true,
        'location' => {
          'base' => '$XDG_DATA_HOME/sqlmap', # ~/.local/share/sqlmap
          'history' => {
            'path' => '<base>/history',
            'description' => "Directory containing history files.\n" \
                             "os.hst stores system commands entered when using --os-pwn option.\n" \
                             'sql.hst stores SQL quries entered when using --os-shell option.'
          },
          'logs' => {
            'path' => '<base>/output',
            'description' => "Directory containing a folder per target.\n" \
                             "<target>/log contains all successful injection vectors.\n" \
                             "<target>/session.sqlite contains retrieved data.\n" \
                             '<target>/target.txt contains target URL + command used.'
          }
        }
      }.freeze
    end
  end
end

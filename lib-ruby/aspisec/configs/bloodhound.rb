# frozen_string_literal: true

module Aspisec
  class Config
    module Configs
      BLOODHOUND = {
        'enabled' => false,
        'location' => {
          'base' => '/var/lib/neo4j',
          'database' => {
            'path' => '<base>/data/databases/neo4j',
            'description' => "Folder containing the database data.\n" \
                             "Data contains all dumped AD objects.\n" \
                             "Bloodhound use default neo4j database.\n" \
                             '⚠ Requires neo4j or root permissions to remove.'
          },
          'transactions' => {
            'path' => '<base>/data/transactions/neo4j',
            'description' => "Folder containing database transactions.\n" \
                             "Bloodhound use default neo4j database.\n" \
                             '⚠ Requires neo4j or root permissions to remove.'
          }
        }
      }.freeze
    end
  end
end

## [0.1.0 - unreleased]

- **New modules**
  - jwt_tool
  - MANSPIDER
  - ncrack
  - weevely
  - spiderfoot
  - Remmina
  - MobSF
  - MongoDB Compass
  - MongoDB Shell (mongosh)
  - lsassy
  - Semgrep
  - WhatWaf
  - amass
  - Bloodhound
  - ffuf
- **New features**
  - Locations now support [globbing](https://ruby-doc.org/3.3.0/Dir.html#method-c-glob), useful when needing to remove several files in a directory while not removing the whole directory (e.g. log files with rotation in the same directory as the configuration file)
- **Quality**
  - The configuration now has a version and there are several checks to detected mismatch between the configuration version and the tool version. This prevents the user performing complex debugging after an update.
  - Warns the user when a location is not deletable (lack of permissions).
- **UX**
  - More compact display of `aspisec list`. As the list of modules is growing, the output is longer, displayed on several screens, requiring to scroll while being a very thin column. That was really a waste of space. The new compact display better optimizes the usage of space. Now there is one module per line and all locations are displayed horizontally (2D) rather than vertically under the module (1D).

## [0.0.2]

- Change from `xdg` dependency to `sxdg`, allowing support for Ruby 3.1 and 3.2 as well as 3.3.
  - Nothing change from user perspective

## [0.0.1]

- Initial version

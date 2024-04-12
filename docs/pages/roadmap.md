# Roadmap

More modules:

- [ ] 🟥 ~/.local/share/remmina/
  - false by default
  - could contain usernames, passwords, IP addresses, target name
- [ ] 🟥 ~/.dbgate
  - false by default
  - connections.jsonl, target domain or IP
- [ ] 🟥 ~/.MobSF
  - debug.log, at least APK name
  - downloads/, files extracted from APK or screenshots of the app running
  - uploads/, decompressed apk
  - db.sqlite3, at least APK name
- [ ] 🟥 MongoDB Compass
  - ~/.mongodb/compass/
    - directory containing log files
    - credentials are redacted but still contains IP and port
- [ ] 🟥 MongoDB mongosh
  - ~/.mongodb/mongosh
    - 64a5690e15d6daaef79c470c_log, at least target (IP port)
    - mongosh_repl_history, history of commands
    - warning removing root folder will remove "config" file too
  - false by default on the root folder, true by default for mongosh_repl_history only
- [ ] 🟥 ~/.python_history
- [ ] 🟥 ~/.psql_history
- [ ] 🟥 ~/.irb_history
- [ ] 🟥 ~/.rdbg_history
- [ ] 🟥 ~/.rediscli_history
- [ ] 🟥 ~/.semgrep
  - last.log, contains project path
  - semgrep.log, contains project path
- [ ] 🟥 ~/.whatwaf
  - whatwaf.sqlite, contaisn cached payloads and URLs
- [ ] 🟥 ~/.bash_history
- [ ] 🟥 ~/.zsh_history

Features:

- CLI
  - 🟦 option to read config file from non-default location
    - requires modification to the config class
  - 🟨 autoclean and describe override
- Configuration
  - 🟨 prompt color configurable https://github.com/piotrmurach/tty-prompt?tab=readme-ov-file#3-settings
  - 🟨 separator configurable
- Features
  - 🟦 old projects
  - 🟨 clean history (filter by keywork)
- Client
  - 🟦 Crystal client

Legend:

- **Priority**
  - 🟥 High
  - 🟨 Medium
  - 🟦 Low
  - ⬛ Not planned unless someone want to PR

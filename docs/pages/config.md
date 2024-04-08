# Config

When no configuration file exists, Aspisec will automatically create a default one under `$XDG_CONFIG_HOME/aspisec/aspisec.config.yaml` (which will typically be `~/.config/aspisec/aspisec.config.yaml`).

The default values are documented in [the library documentation (DEFAULT_CONFIG)](https://acceis.github.io/aspisec/ruby/Aspisec/Config#DEFAULT_CONFIG-constant) but anything should be self-explanatory enough so you don't need to read it.

## Autoclean

`aspisec.autoclean.enabled` allows you to choose between:

- _interactive mode_: (`false`, default) ask confirmation (`Y/n`) before removing each location
- _automatic mode_: (`true`) auto clean, remove files without asking confirmation

## Description

`aspisec.describe.enabled` controls if the description for each location is displayed or not. If you already know what everything is doing, disabling it allows having a lighter output.

## Modules

### Disabling

Each module can be separately disabled, e.g. `<tool>.enabled` so it will not be taken into consideration while cleaning.

### Locations

Each module will look for the files from a default location which is the most common.
But if you have deployed the tool in an uncommon location (exotic distribution, `git clone` in random places) or a custom location (under `/opt`), you can change the location where Aspisec will look for, e.g. `<tool>.location.base`.

Aspisec is using standard [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) variables like `$XDG_DATA_HOME` to be more cross-platform. But you could use an absolute path if you don't need your config to be portable, e.g. `/home/noraj/.local/share/sqlmap` instead of `$XDG_DATA_HOME/sqlmap`.

For each location (feature, file, directory) you can configure the path too (`<tool>.location.<lcoation>.path`) but it's very unlikely you would need to. `<base>` is a keyword resolved by Aspisec refering to `<tool>.location.base`. You could change the location description too if you want it to be shorter or to add emojis.

### Audit

The `audit` section is unused and is just a placeholder for future features.

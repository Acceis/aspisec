# Usage

## CLI

### General help

```
$ aspisec -h
AspiSec v0.0.1

Usage:
  aspisec [options] clean
  aspisec -h | --help
  aspisec --version

Commands:
  clean                   Removes the traces left by offensive security tools

Options:
  --debug                 Display arguments
  -v, --verbose <level>   Set verbosity level (see documentation) [default: 2]
  -h, --help              Show this screen
  --version               Show version

Examples:
  aspisec clean

Project:
  source (https://github.com/acceis/aspisec)
  documentation (https://acceis.github.io/aspisec)
```

?> **Note**: You can check log / verbosity levels [here](https://acceis.github.io/ruby/Aspisec/Logger#LOG_LEVEL-constant).

### Cleaning

Starting the cleaning is as easy as that:

```
$ aspisec clean
```

By default, it will be interactive, the description of each file / directory will be displayed, etc. If you want to change the default behavior, see [config](pages/config.md).

## Library

The main class that **does the job** is [Aspisec::Clean](https://acceis.github.io/ruby/Aspisec/Clean).

Of course, [Aspisec::Config](https://acceis.github.io/ruby/Aspisec/Config) manages the configuration and [Aspisec::Logger](https://acceis.github.io/ruby/Aspisec/Logger) the logger (level of additional information displayed).

[Aspisec::Module](https://acceis.github.io/ruby/Aspisec/Module) is a generic module class with core methods and properties. [Aspisec::Module::Location](https://acceis.github.io/ruby/Aspisec/Module/Location) is a generic location subclass. A _location_ is either a file or directory handled by modules.

Then [Aspisec::Modules](https://acceis.github.io/ruby/Aspisec/Modules) is just a Ruby module (namespace) to store all Aspisec modules. Each Aspisec module matches a tool. E.g. for Netexec, the module is [Aspisec::Modules::Netexec](https://acceis.github.io/ruby/Aspisec/Modules/Netexec).

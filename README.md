# My personal dotfiles + a minimal installer with backups
This is a collection of the configuration files I use. Included at the moment are configs for __bash__, __vim__, __redshift__ and __polybar__. This repo includes a simple installer, as well as the option to include configs of your own. The installer is 100% written in pure POSIX-compliant sh.

## Instalation and usage
To install all contained configs, simply run:

`./setup.sh`

This also creates backups: for each file that would be overwritten by the setup, a copy is created in the file's directory, prefixed by `.` and suffixed by `.yyyymmdd.nnn`, where `nnn` starts at `000` and increments during a given day. Progress and stats are displayed too.

To supply your own files, put them in the `files` directory and then edit the directives in `install.sh`. Currently there are two available directives - `install` and `install_if_exists`, more to be added.

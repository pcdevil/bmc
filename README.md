# `bmc` - bootstrap my computer
A set of install and config commands to make os (re)installs more easy.

## Tasks
The entrypoint of the application is the [`Makefile`](Makefile), all available
feature is created as a task.

| Task                          | Description                                              | [Prerequisites]             |
| ----------------------------- | -------------------------------------------------------- | --------------------------- |
| `install-bat`                 | Installs the [bat] file displayer                        | Rust language               |
| `install-brew`                | Installs the [Homebrew] package manager                  | MacOS system                |
| `install-docker`              | Installs the [Docker] containerisation solution          | Target binary folder        |
| `install-fnm`                 | Installs the [Fast Node Manager]                         | Target folder               |
| `install-fzf`                 | Installs the [fuzzy finder]                              | Target folder               |
| `install-git`                 | Installs the [Git] version manager                       | Homebrew on MacOS system    |
| `install-less`                | installs the [less] pager                                | Target folder               |
| `install-linux-localisations` | installs the language packs and dictionaries for [Linux] | Linux system                |
| `install-oh-my-zsh`           | Installs the [Oh My Zsh] framework                       | Target folder               |
| `install-ripgrep`             | Installs the [ripgrep] search tool                       | Rust language               |
| `install-rust`                | Installs the [Rust] programming language                 |                             |
| `install-spaceship-prompt`    | Installs the [Spaceship ZSH] prompt                      | Target folder               |
| `set-gnome-settings`          | Modifies and tweaks [GNOME] behaviour                    | Linux system, GNOME desktop |
| `set-macos-settings`          | Modifies and tweaks [MacOS] behaviour                    | MacOS system                |

There is also a special `help` task, which lists the available tasks.

## Task prerequisites
Some tasks doesn't use system-wide installations, such as [APT] or [Homebrew],
or relies on a characteristic of the system. Below you read all these special
behaviour modifiers.

| Prerequisite         | Description                                                                                                           |
| -------------------- | --------------------------------------------------------------------------------------------------------------------- |
| GNOME desktop        | The task is only available if the desktop environment is [GNOME]                                                      |
| Homebrew             | The task invokes the `install-brew` task if the [Homebrew] package manager is not already available                   |
| Linux system         | The task is only available if the operating system is [Linux]                                                         |
| MacOS system         | The task is only available if the operating system is [MacOS]                                                         |
| Rust language        | The task invokes the `install-rust` task if the [Rust] programming language is not already available                  |
| Target binary folder | A `TARGET_BIN_DIR` environment variable is necessary to be defined as the destination folder for the executable files |
| Target folder        | A `TARGET_DIR` environment variable is necessary to be defined as the destination folder for the application          |

## License
Available under the [MIT license](LICENSE.md).

[APT]: https://wiki.debian.org/Apt
[bat]: https://github.com/sharkdp/bat/
[Docker]: https://docker.com/
[Fast Node Manager]: https://github.com/Schniz/fnm/
[fuzzy finder]: https://github.com/junegunn/fzf
[Git]: https://git-scm.com/
[GNOME]: https://www.gnome.org/
[Homebrew]: https://brew.sh/
[less]: http://www.greenwoodsoftware.com/less/
[Linux]: https://www.linuxfoundation.org/
[MacOS]: https://www.apple.com/macos/
[Oh My Zsh]: https://github.com/ohmyzsh/ohmyzsh/
[Prerequisites]: #task-prerequisites
[ripgrep]: https://github.com/BurntSushi/ripgrep/
[Rust]: https://rustup.rs/
[Spaceship ZSH]: https://github.com/denysdovhan/spaceship-prompt

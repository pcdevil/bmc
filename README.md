# `bmc` - bootstrap my computer
A set of install and config commands to make os (re)installs more easy.

## Tasks
The entrypoint of the application is the [`Makefile`](Makefile), all available
feature is created as a task.

While some tasks use existing tools, such as [APT] or [Homebrew] to install the
required programs, others use [Git]'s clone command to achieve the appropriate
effect. For these tasks a `TARGET_DIR` environment variable is necessary to be
defined as the destination folder.

| Task                          | Description                                            | `TARGET_DIR` required? |
| ----------------------------- | ------------------------------------------------------ |:----------------------:|
| `install-bat`                 | Installs the [bat] file displayer                      | 🗶                      |
| `install-brew`                | Installs the [Homebrew] package manager                | 🗶                      |
| `install-fnm`                 | Installs the [Fast Node Manager]                       | ✓                      |
| `install-fzf`                 | Installs the [fuzzy finder]                            | ✓                      |
| `install-git`                 | Installs the [Git] version manager                     | 🗶                      |
| `install-less`                | installs the [less] pager                              | ✓                      |
| `install-linux-localisations` | installs the language packs and dictionaries for Linux | 🗶                      |
| `install-oh-my-zsh`           | Installs the [Oh My Zsh] framework                     | ✓                      |
| `install-ripgrep`             | Installs the [ripgrep] search tool                     | 🗶                      |
| `install-rust`                | Installs the [Rust] programming language               | 🗶                      |
| `install-spaceship-prompt`    | Installs the [Spaceship ZSH] prompt                    | ✓                      |
| `set-gnome-settings`          | Modifies and tweaks GNOME behaviour                    | 🗶                      |
| `set-macos-settings`          | Modifies and tweaks MacOS behaviour                    | 🗶                      |

There is also a special `help` task, which lists the available tasks.

## License
Available under the [MIT license](LICENSE.md).

[APT]: https://wiki.debian.org/Apt
[bat]: https://github.com/sharkdp/bat/
[Fast Node Manager]: https://github.com/Schniz/fnm/
[fuzzy finder]: https://github.com/junegunn/fzf
[Git]: https://git-scm.com/
[Homebrew]: https://brew.sh/
[less]: http://www.greenwoodsoftware.com/less/
[Oh My Zsh]: https://github.com/ohmyzsh/ohmyzsh/
[ripgrep]: https://github.com/BurntSushi/ripgrep/
[Rust]: https://rustup.rs/
[Spaceship ZSH]: https://github.com/denysdovhan/spaceship-prompt

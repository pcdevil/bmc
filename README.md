# `bmc` - bootstrap my computer
A set of install and config commands to make os (re)installs more easy.

## Tasks
The entrypoint of the application is the [`Makefile`](Makefile), all available
feature is created as a task.

While some tasks use existing tools, such as [APT] or [Homebrew] to install the
required programs, others use [Git]'s clone command to achieve the appropriate
effect. For these tasks a `TARGET_DIR` environment variable is necessary to be
defined as the destination folder.

| Task                       | Description                              | `TARGET_DIR` required? |
| -------------------------- | ---------------------------------------- |:----------------------:|
| `install-brew`             | Installs the [Homebrew] package manager  | 🗶                      |
| `install-git`              | Installs the [Git] version manager       | 🗶                      |
| `install-oh-my-zsh`        | Installs the [Oh My Zsh] framework       | ✓                      |
| `install-rust`             | Installs the [Rust] programming language | 🗶                      |
| `install-rust-binaries`    | Installs Rust packages                   | 🗶                      |
| `install-spaceship-prompt` | Installs the [Spaceship ZSH] prompt      | ✓                      |

There is also a special `help` task, which lists the available tasks.

## License
Available under the [MIT license](LICENSE.md).

[APT]: https://wiki.debian.org/Apt
[Git]: https://git-scm.com/
[Homebrew]: https://brew.sh/
[Oh My Zsh]: https://github.com/ohmyzsh/ohmyzsh/
[Rust]: https://rustup.rs/
[Spaceship ZSH]: https://github.com/denysdovhan/spaceship-prompt

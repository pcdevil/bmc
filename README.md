# `bmc` - bootstrap my computer
A set of install and config commands to make os (re)installs more easy.

## Tasks
The entrypoint of the application is the [`Makefile`](Makefile), all available
feature is created as a task. The tasks utilises the `TARGET_DIR` environment
variable for the output directory.

| Task                       | Description                             |
| -------------------------- | --------------------------------------- |
| `help`                     | List the available tasks                |
| `install-brew`             | Installs the [Homebrew] package manager |
| `install-git`              | Installs the [Git] version manager      |
| `install-oh-my-zsh`        | Installs the [Oh My Zsh] framework      |
| `install-spaceship-prompt` | Installs the [Spaceship ZSH] prompt     |

## License
Available under the [MIT license](LICENSE.md).

[Git]: https://git-scm.com/
[Homebrew]: https://brew.sh/
[Oh My Zsh]: https://github.com/ohmyzsh/ohmyzsh/
[Spaceship ZSH]: https://github.com/denysdovhan/spaceship-prompt

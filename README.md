# dotfiles

My [dotfiles](https://wiki.archlinux.org/title/Dotfiles) for Kitty, ZSH, other programs, and additionally some scripts.

These dotfiles are written on Arch Linux, so there is 0 guarantee they work on other systems.
Although, since I'm using [dmitmel's dotfiles](https://github.com/dmitmel/dotfiles) in a submodule, I'm trusting they work on the following platforms:

- Arch Linux,
- Linux Mint,
- server Ubuntu,
- macOS with GNU coreutils (i.e. BSDs are not supported),
- Android with Termux.

If you are uncertain about what any of these things do, I recommend you:

- Do not use them.
- Read the source code, and, additionally,
  - Read the source code of dmitmel's dotfiles.

## Configuration

Some minor configuration is offered in scripts:

- `$DOTFILES_BOT_TOKEN`: Environment variable that should house the Discord bot token used in scripts.
- `$DOTFILES_WEBHOOK_URL`: Environment variable that should house the Discord webhook URL used in `tophook`.

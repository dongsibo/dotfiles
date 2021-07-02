# Dotfiles

These are the dotfiles that I use.
I manage them with [GNU Stow](https://www.gnu.org/software/stow/ 'Stow - GNU Project - Free Software Foundation').

## Example usage

See <https://blog.xero.nu/managing_dotfiles_with_gnu_stow>.
The dotfiles here also make use of a `.stowrc` file to be read by *stow* (see `man stow.8`).

### List unstowed dotfiles

There is no easy way to list unstowed (dotfile) packages (as far as I know).
Assuming your dotfiles are installed to `~/dotfiles/`, the following command can give you an idea of which dotfile packages are unstowed:

```
find ~/dotfiles -maxdepth 1 ! \( -path ~/dotfiles -o -path '*/.git' \) -type d -printf '%f\0' \
    | xargs -0r stow -nd ~/dotfiles -v --dotfiles
```

Unstowed dotfiles will be listed by lines starting with `LINK:`.
The `--dotfiles` option from `.stowrc` is necessary above because `.stowrc` will only be read if *stow* is ran in the same directory.

See `man find.1`, `man xargs.1`, and `man stow.8` for more information.

# Dotfiles

These are the dotfiles that I use.
I manage them with [GNU Stow][stow].

## Example usage

See <https://github.com/xero/dotfiles#how-it-works>.
The dotfiles here also make use of a `.stowrc` file to be read by *stow* (see `man stow.8`).

### List unstowed dotfiles

There is no easy way to list unstowed (dotfile) packages (as far as I know).
Assuming your dotfiles are installed to `~/dotfiles/`, the following command can give you an idea of which dotfile packages are unstowed:

```
find ~/dotfiles -maxdepth 1 ! -path ~/dotfiles ! -path '*/.git' -type d -printf '%f\0' \
    | xargs -0r stow -nd ~/dotfiles -v --dotfiles
```

This command does the following:

* Get all non-git directories in `~/dotfiles` as a null-delimited list.
  Null is used as a delimiter since it is unlikely a directory name contains null characters.
  We assume that each one of these directories is a dotfile package.
* Use [xargs][xargs] to input this list of dotfile packages to a dry, verbose run of *stow*.
  The reasoning behind this is as follows:
  * Stowing an unstowed package will result in verbose output with names of the relevant dotfiles being stowed.
  * We only want to list unstowed dotfiles instead of actually stowing them, so we dry run with the `-n` option.

Unstowed dotfiles will be listed by lines starting with `LINK:`.
The `--dotfiles` option from `.stowrc` is necessary above because `.stowrc` is only read if *stow* is ran in the same directory as this rc file.

See `man find.1`, `man xargs.1`, and `man stow.8` for more information.

[stow]: https://www.gnu.org/software/stow/ 'Stow - GNU Project - Free Software Foundation'
[xargs]: https://www.gnu.org/software/findutils/ 'findutils - GNU Project - Free Software Foundation (FSF)'

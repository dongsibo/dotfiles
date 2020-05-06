# Dotfiles

These are the dotfiles that I use.
I manage them with [GNU Stow](https://www.gnu.org/software/stow/ 'Stow - GNU Project - Free Software Foundation').

## Example Usage

To install the contents of `vim` to your home directory, say `${HOME}`:

```
stow --target=${HOME} vim
```

The `--dotfiles` options is implied in `.stowrc`.

To unstow the contents of `vim` from your home directory:

```
stow --target=${HOME} --delete vim
```

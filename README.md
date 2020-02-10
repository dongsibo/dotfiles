# Dotfiles

These are the dotfiles that I use.
I manage them with [Gnu Stow](https://www.gnu.org/software/stow/ 'Stow - GNU Project - Free Software Foundation').

## Example Usage

To install the contents of `vim` to your home directory, say `/home/dongsibo`:

```
stow --target=/home/dongsibo vim
```

The `--dotfiles` options is implied in `.stowrc`.

To unstow the contents of `vim` from your home directory:

```
stow --target=/home/dongsibo --delete vim
```

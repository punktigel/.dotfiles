# .dotfiles

## Tracking dotfiles with a bare git repository
### Starting a new git repository

1. Create a new local bare git repository with main as the default branch
```bash
git init --bare $HOME/.dotfiles -b main
```

2. Then create an alias to work with the git repository and specify the directories.
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"'
```
3. Optional set this flag to hide untracked files
```bash
dotfiles config --local status.showUntrackedFiles no
```
4. Connect to a repository online
```bash
git remote add origin <Git repository URL>
```

### Clone the repository
1. Clone the bare repository to the specified location *(~/.dotfiles)*
```bash
git clone --bare <Git repository URL> $HOME/.dotfiles
```
2. Then create an alias to work with the git repository and specify the directories.
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"'
```
3. Get a copy of the repository
```bash
dotfiles checkout
```
4. Optional set this flag to hide untracked files
```bash
dotfiles config --local status.showUntrackedFiles no
```
> Remove or overwrite existing files `dotfiles checkout -f`

**Some sources:**
- [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)
- [https://wiki.archlinux.org/title/Dotfiles](https://wiki.archlinux.org/title/Dotfiles)


## Patching fonts
### Package manager
Install and search for fonts with the package manager

### Install manually
1. Create a new directory for the font family at `/usr/local/share/fonts/`
2. Download a font family and extract the font files
3. Copy the font files `(fontfamily.ttf)`
4. Update the font cache
```bash
fc-cache -v
```

**Patched Fonts:** [Nerd Fonts](https://www.nerdfonts.com/)

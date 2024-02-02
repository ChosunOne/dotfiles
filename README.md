# Dependencies
Install git with:
`pacman -S git`

Install GNU Stow with:
`pacman -S stow`

# Install
First checkout the repository

```shell
$ git clone git@github.com/ChosunOne/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks
```shell
$ stow .
```

If you get stuck, refer to https://www.youtube.com/watch?v=y6XCebnB9gs for a walkthrough

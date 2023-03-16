# Portable Neovim environment

## Goals
- Have more than one independent Neovim environment that not share data and configuration with any other. You can test plugin combinations unusual for you without changing your regular Neovim environment.
- Allow easily disable extensions from running (by commenting `packadd`-ed entry in `init.lua`) or remove.

## Install and configure extensions
- Run `make check-requirements` to check requirements that may be needed to use extensions used there
- Run `make start` to configure local git aliases, then fetch, install and prepare extensions

## Running
```sh
./bin/nvim
```

You can append `"</path/to/this/project>/bin"` to `"$PATH"` in your shell environment if you want to use some copy of this project as a regular Neovim environment. Then check if the above executables replace the previously used `nvim` (`command -V nvim` for example). It also simplifies using this executables by GUI (`nvim-qt`).

Note that some extensions are not loaded by `packadd!` from `init.lua`.

<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo

Lightweight, keyboard-oriented IDE for the masses.

[![AUR](https://img.shields.io/aur/version/tijolo-git)](https://aur.archlinux.org/packages/tijolo-git)

## Project status

**Pre Alpha or something**, not yet released. I'm already using it in my daily work and also to write itself, however it
doesn't have the enough minimum planned features to be released yet. The [TODO](./TODO.md) file list things I'm working on.

## Project goals

- Run fast, something you don't see very often in new desktop applicaitons.
- Fuzzy search powered locator for a simple and pleasant code navigation.
- Keyboard focused user interface.
- Git support without hide git, so you can trust it.
- Support Language Server Protocol.
- Plain simple UI, distraction free.

## Features

 - [x] Syntax highlighting, Undo/Redo and all the things supported by GtkSourceView4.
 - [x] Fuzzy search to open project files.
 - [ ] Custom language identers.
 - [ ] Easy Split Screen inspired by Tilix.
 - [ ] Language Server support for auto completion.
 - [x] Language Server Protocol support for class/method navigation.
 - [ ] Project wide symbol fuzzy search.
 - [x] Open document symbol fuzzy search.
 - [ ] Basic git commands support (log/blame).

## Things I have no plans to implement in a near future

- Support for other version control systems besides git.
- Printing support.
- Support for specific build systems.

## Installing

If you use Archlinux, there's a AUR package available for latest git version.

```
$ yay -S tijolo-git
```

More packages (for e.g. Ubuntu) only when first version get released.

## Compiling from source

You need the Crystal 0.35 compiler, GTK3 and GTKSourceView4 installed.

```
$ make
$ sudo make install PREFIX=/usr
```

## Usage

Pass a directory of a file under a git repository to open a project. Just call it without arguments to see a list of available projects.

## Contributing

1. Fork it (<https://github.com/hugopl/tijolo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Any ideas/suggestions, fill in an issue.

## Contributors

- [Hugo Parente Lima](https://github.com/hugopl) - creator and maintainer

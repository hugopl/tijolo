<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo

Lightweight, keyboard-oriented IDE for the masses.

## Project status

**Feature imcomplete**, not yet released, it doesn't have the enough minimum planned features implemented yet.

## Project goals

- It must be fast.
- Fast and easy source code navigation using fuzzy search.
- Keyboard focused user interface.
- In-editor Git support for things like git blame and git log.
- Support Language Server Protocol.
- Keep the UI plain simple.

## Features

 - [x] Syntax highlighting, Undo/Redo and all the things supported by GtkSourceView4.
 - [x] Fuzzy search to open project files.
 - [ ] Custom language identers.
 - [ ] Easy Split Screen inspired by Tilix.
 - [ ] Language Server support for auto completion.
 - [ ] Language Server Protocol support for class/method navigation.
 - [ ] Language Server Protocol support for class/method fuzzy search.
 - [ ] Basic git commands support (log/blame).

## Things I have no plans to implement in a near future

- Support for other version control systems besides git.
- Printing support.
- Support for specific build systems.

## Compiling

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

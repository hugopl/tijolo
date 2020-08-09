<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo

Lightweight, keyboard-oriented IDE for the masses.

[![AUR](https://img.shields.io/aur/version/tijolo-git)](https://aur.archlinux.org/packages/tijolo-git)

## Project status

**Alpha**. I'm already using it in my daily work and also to write itself.

The [TODO](./TODO.md) works like a roadmap and also list things I'm working on, it can give you a better idea of the project
status.

## Project goals

- Run fast, something you don't see very often in new desktop applicaitons.
- Have a simple distraction free UI.
- Keyboard focused user interface.
- Easy/fast code navigation.
- ♥️ Git.
- ♥️ Language Servers.

## Things I have no plans to implement in a near future

- Support for other version control systems besides git.
- Printing support.
- Support for specific build systems.

## Installing

### Archlinux

There's a AUR package for every release.

```
$ yay -S tijolo
```

There's also AUR package available for latest git version, named `tijolo-git`.

### Ubuntu

There should be a home made Ubuntu package for every release, check the
[github release page](https://github.com/hugopl/tijolo/releases).

If you want to create a package from git, clone the repository then run `./packages/make-ubuntu-package`, this will generate
a docker image, build Tijolo inside that image then copy it back, out of the container. Not best approach to build a deb
package but works on non-deb machines.

## Compiling from source

You need the Crystal 0.35 compiler, GTK3, GTKSourceView4, GIR packages for these GTK lirbaries, libYAML and libGit2 installed.

```
$ make
$ sudo make install PREFIX=/usr
```

Tijolo use [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font, you can _make install_ them if you don't already have
them installed:

```
$ sudo make install-fonts PREFIX=/usr
```

To uninstall:

```
$ sudo make uninstall uninstall-fonts PREFIX=/usr
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

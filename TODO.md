<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

The re-write wasn't a simple rewrite, but the creation of GObject binding generator for Crystal and also the GTK4 bindings.
I also started to write an code editor widget but it was too much work to my limited time to work on this.

Tasks

## Tasks before release 0.8.0

- [x] Create a [binding generator for GTK4](https://github.com/hugopl/gi-crystal).
- [x] Create a [GTK4 bidings](https://github.com/hugopl/gtk4.cr).
- [x] Create bindings for [tree-sitter](https://tree-sitter.github.io/).
- [x] Create GtkSourceView5 (GSV) bindings.
- [x] Add GSV to Tijolo and keep it compiling with both editor widgets (-Dexperimental).
- [x] Remove default key bindings from GSV.
- [x] Create a layout manager to let views be split in stacks again.
- [x] Polish view navigation code.
- [x] Move view from one stack to another.
- [x] Auto update view if it wasn't modified.
- [x] Sort lines on F9
- [x] Goto line locator
- [x] Move lines
- [x] Move viewport
- [x] Comment code on `Ctrl+/`
- [x] Fullscreen
- [x] Enclose selection with parentesis when typing `(`.
- [x] Implement text find.
- [x] Show current git branch somewhere (header bar?).
- [x] Show project files on sidebar (just initial dir, waiting for fixes on gi-crystal).
- [x] Add menu to change branches.
- [x] Change GSV style when changing dark/light themes.
- [x] Create better color themes.
- [x] Remove trailing whitespaces on save.
- [x] Maximinize view
- [x] Polish view split code.
- [ ] Increase/Decrease font size
- [ ] Ask to reload view on app re-focused or some modified view focused (and remove file monitors)
- [ ] Add animations to view moves.
- [ ] Git locator
- [ ] Remove deprecated GTK stuff from Welcome widget.
- [ ] Save sessions.

## Other stuff that I must do, but isn't a priority

- [ ] Add "Clone Repository" dialog.
- [ ] Add "New Project" dialog.
- [ ] Add settings dialog, or maybe just continue with the file based approach.

## GI-Crystal improvements needed by Tijolo

- [ ] [Allow GObject signals with pure Crystal object as parameters](https://github.com/hugopl/gi-crystal/pull/75).
- [ ] Fix gi-crystal for methods with multiple out params, so some other Pango functions can be used.
- [ ] Implement `gtk_widget_class_add_binding_signal` on gtk4 shard, so shortcuts can be easily set.
- [ ] Implement a way to let Crystal objects being created by GtkBuilder on C land, so UI code can be simplified.
- [ ] Rework how GTK4 bindings uses template widgets, using a macro processing to not need the long annotations with list
      of ids and `template_child` calls.

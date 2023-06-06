<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

The rewrite isn't not just a plain GTK4 port but the implementation of the text widget with syntax highlighting, etc. So
it can take some time to finish... It will be release once I start using it to write itself, nowadays 0.8.0 is written
using version v0.7.x.

## Pre re-write tasks

- [x] Create a [binding generator for GTK4](https://github.com/hugopl/gi-crystal).
- [x] Create a [GTK4 bidings](https://github.com/hugopl/gtk4.cr).
- [x] Create bindings for [tree-sitter](https://tree-sitter.github.io/).

## Tasks needed for a MVP

- [x] Draw editor background grid.
- [x] Draw cursors.
- [x] Move cursors.
- [x] Implement Scrollable interface.
- [x] Study tree-sitter.
- [x] Handle text input (just really basic stuff to be able to test few things).
- [x] Fix gi-crystal structs, so Pango can be used..
- [x] Create a CodeLayout object to cache line render nodes
- [x] Implement piecetable `#save`.
- [x] Implement piecetable `#insert`.
- [x] Implement piecetable `#delete`.
- [ ] Let piecetable line aware.
- [ ] Implement piecetable `#line_col_to_pos`.
- [ ] Implement piecetable `#pos_line_col`.
- [ ] Implement piecetable `#line_size`.
- [ ] Balance tree used on piecetable (redblack or splay tree 🤔️).
- [ ] Publish piece table shard.
- [ ] Use Piece Table shard in Tijolo.
- [ ] Keep tree-sitter code model up to date with piece table buffer.
- [ ] Use a splay tree with list behavior for code line cache of render nodes.
- [ ] Fix Pango bindings for `Pango::AttrList` class and `Pango::Attribute`.
- [ ] Render highlighted text with tree-sitter using `Pango::AttrList` instead of slow format strings.
- [ ] Implement text (multiple) selection model.
- [ ] Implement undo/redo for piece table.
- [ ] Have tree-sitter highlight queries for Crystal.
- [ ] Release alpha1.

## Tasks needed to let it be more than a MVP

- [ ] Create a layout manager to let views be split in stacks again.
- [ ] Release alpha2.
- [ ] Make cursors blink.
- [ ] Hide mouse when typing.
- [ ] Add [power mode](https://marketplace.visualstudio.com/items?itemName=hoovercj.vscode-power-mode) for fun.
- [ ] Multiple cursors.
- [ ] Release beta1.
- [ ] Render tree-sitter errors.
- [ ] Support auto-completion
- [ ] Let piece table inform modified lines.
- [ ] Support custom editor gutter, so we can show a Kdevelop-like in-editor git blame.
- [ ] Add "Clone Repository" dialog.
- [ ] Add "New Project" dialog.
- [ ] Add settings dialog, or maybe just continue with the file based approach.
- [ ] Implement cursor position history.
- [ ] Save sessions.
- [ ] Word wrap.

## GI-Crystal improvements needed by Tijolo

- [ ] [Allow GObject signals with pure Crystal object as parameters](https://github.com/hugopl/gi-crystal/pull/75).
- [ ] Fix gi-crystal for methods with multiple out params, so some other Pango functions can be used.
- [ ] Implement `gtk_widget_class_add_binding_signal` on gtk4 shard, so shortcuts can be easily set.
- [ ] Implement a way to let Crystal objects being created by GtkBuilder on C land, so UI code can be simplified.
- [ ] Rework how GTK4 bindings uses template widgets, using a macro processing to not need the long annotations with list
      of ids and `template_child` calls.

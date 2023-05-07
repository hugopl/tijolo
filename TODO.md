<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order.

The rewrite isn't not just a plain GTK4 port but the implementation of the text widget with syntax highlighting, etc. So
it can take sime time to finish... It will be release once I start using it to write itself, nowadays 0.8.0 is written
using version v0.7.x.

## Pre re-write tasks

- [x] Create a [binding generator for GTK4](https://github.com/hugopl/gi-crystal).
- [x] Create a [GTK4 bidings](https://github.com/hugopl/gtk4.cr).
- [x] Create bindings for [tree-sitter](https://tree-sitter.github.io/).

## Code editor widget

- [x] Draw editor background grid.
- [x] Draw cursors.
- [x] Move cursors.
- [ ] Make cursors blink.
- [x] Implement Scrollable interface.
- [x] Study tree-sitter.
- [x] Handle text input (just really basic stuff to be able to test few things).
- [x] Fix gi-crystal structs, so Pango can be used..
- [ ] Fix Pango bindings for `Pango::AttrList` class and `Pango::Attribute`.
- [ ] Fix gi-crystal for methods with multiple out params, so some other Pango functions can be used.
- [x] Create a CodeLayout object to cache PangoLayout's per line.
- [x] Render highlighted text with tree-sitter using pango attributes.
- [ ] Implement text selection.
- [ ] Run first round of obvious optimizations.
- [ ] Multiple cursors.
- [ ] Render tree-sitter errors.
- [ ] Revisit what was done so far.
- [ ] Add [power mode](https://marketplace.visualstudio.com/items?itemName=hoovercj.vscode-power-mode) for fun.
- [ ] Replace dummy text buffer by a piece table 🔥️
- [ ] Support auto-completion
- [ ] Strip trailing whitespaces on save only on modified lines.
- [ ] Support custom editor gutter, so we can show a Kdevelop-like in-editor git blame.

## General UI

- [ ] Implement `gtk_widget_class_add_binding_signal` on gtk4 shard, so shortcuts can be easily set.
- [ ] Hide mouse when typing.
- [ ] Implement a way to let Crystal objects being created by GtkBuilder on C land, so UI code can be simplified.
- [ ] Plan better git integration.
- [ ] Implement cursor position history.
- [ ] Have a nice settings UI?
- [ ] Implement keyboard focused open dialog like Howl editor.
- [ ] Save sessions.

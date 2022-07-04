<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order.

## 0.8.0 release

- [x] Create a [binding generator for GTK4](https://github.com/hugopl/gi-crystal).
- [x] Create a [GTK4 bidings](https://github.com/hugopl/gtk4.cr).
- [ ] Implement a new text widget from scratch using a dummy array of lines buffer.
- [ ] Use [tree-sitter](https://github.com/tree-sitter/tree-sitter) parser for Crystal, there are 3 on github.

## 0.9.0 release

- [ ] Replace dummy line array text buffer by a Piece Table implementation.
- [ ] Fix the buggy location history introduced into 0.3.0 :-)
- [ ] Bufferize text modifications before send to the language server, I guess VSCode does that.
- Some ♥️ to shortcuts
  - [ ] Rebind shortcuts after save config file.
  - [ ] Show shortcuts in UI according the real configured shortcuts.


## Backlog, things that can go in any version...

- [ ] Implement keyboard focused open dialog like Howl editor.
- [x] Open more than one file on command line in different splits, `tijolo file1 --split file2` or `tijolo file1 - file2`.
- Some ♥️ to LSP implementation.
  - [ ] Support LSP auto-complete feature.
  - [ ] Support LSP diagnostics feature.
  - [ ] Support LSP code format feature.
- [ ] Git commit dialog? Not sure yet if this is needed when there are terminal views all around.
- [ ] Rename files (not sure about this... maybe a mouse-only action? since it's a rarely used action for a shortcut).
- [ ] Delete files (not sure about this... maybe a mouse-only action? since it's a rarely used action for a shortcut).
- [ ] Clone repository dialog. (I really don't care about this task, since I don't use it)
- [ ] Automatic close open files not used after X keystrokes if they aren't visible in a split view.
- [ ] Save sessions.
- [ ] I18N support.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame.

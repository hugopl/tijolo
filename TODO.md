<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order. Things I'm already working on have a :no_entry:.

## 0.3.0 release

- [x] Location history, Alt+Shift⬅️/Alt+Shift➡️ navigate through cursor location history.
- :no_entry: Some ♥️ to Git support
  - [ ] Git commit
- :no_entry: Split screen
  - [ ] :no_entry: Ctrl+Shift+P open locator targeting a split view.
  - [ ] Ctrl+Shift+X "zoom" view.
  - [ ] Alt + arrows change from one split view to another.
  - [ ] Ctrl+T split view opening a terminal.

## 0.4.0 release

- [ ] LSP-based auto complete.
- [ ] Text find/replace (study something maybe vim style, but simpler and more intuitive).
- [ ] :no_entry: Better feedback when failed to open language servers.

## 0.5.0 release

- [ ] :fire: Fix GC issue :fire:, this is the project major issue, Crystal GC doesn't like GTK.

## Backlog, things that can go in any version...

- [ ] Rebind shortcuts after save config file.
- [ ] Checkout git branch by clicking on branch in sidebar.
- [ ] Warn if an open file was removed.
- [ ] Warn if an open file was renamed.
- [ ] Rename files.
- [ ] Delete files.
- [ ] Show LSP diagnostics.
- [ ] Support folding (there's a very simple folding implementation in TEPL, just get it and use with LSP)
- [ ] Clone repository dialog. (I really don't care about this task, since I don't use it)
- [ ] Save sessions, with a config flag.
- [ ] I18N support.
- [ ] Smart indent (language specific) or check if using LSP is ok.
- [ ] Notification system for things like "LSP for language X ready!".
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame.

## When Crystal coding is done

- Check why GTK markdown syntax is so slow at first load.
- Check why GTK CSS syntax is so slow at first load.
- Subclass/fork GTK TextView class to try to implement multiple cursors

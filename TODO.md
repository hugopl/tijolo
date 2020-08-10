<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order. Things I'm already working on have a :no_entry:.

## 0.2.0 release

- [ ] Location history, Ctrl+Alt+➡️/Ctrl+Alt+⬅️ navigate through cursor location history.
- [x] Add open button on header bar with list of last N non-project files opened.
- [ ] Ask if user want to open a new Tijolo instance if opening a file from another project.
- [x] Render Welcome Screen when all files are closed and the current project is invalid.
- :no_entry: Some ♥️ to Git support
  - [x] Git checkout.
  - [ ] Git log.
  - [x] Show git locator at ALT+G
  - [ ] Git commit
- [ ] :fire: Fix GC issue :fire:
- :no_entry: Split screen
  - [ ] :no_entry: Ctrl+Shift+P open locator targeting a split view.
  - [ ] Ctrl+Shift+X "zoom" view.
  - [ ] Alt + arrows change from one split view to another.
  - [ ] Ctrl+T split view opening a terminal.

## Probably Post 0.1.0 release

- [ ] Rectractable project tree pane on Alt+0.
- [ ] Text find/replace (study something maybe vim style, but simpler and more intuitive).
- [ ] Clone repository dialog.
- [ ] :no_entry: Better feedback when failed to open language servers.
- [ ] Save sessions, with a config flag.
- [ ] Add retractable output pane, default hidden until ALT+1 or an error, hidden on ESC.
- [ ] I18N support.
- [ ] Smart indent (language specific) or check if using LSP is ok.
- [ ] Notification system for things like "LSP for language X ready!".
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame.

## When Crystal coding is done

- Check why GTK markdown syntax is so slow at first load.
- Check why GTK CSS syntax is so slow at first load.
- Subclass GTK TextView class to try to implement multiple cursors

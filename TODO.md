<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order. Things I'm already working on have a :no_entry:.

## 0.2.0 release

- [ ] :no_entry: Location history, Ctrl+Alt+➡️/Ctrl+Alt+⬅️ navigate through cursor location history.
- [x] Add open button on header bar with list of last N non-project files opened.
- [x] Ask if user want to open a new Tijolo instance when opening a file from another project.
- [x] Render Welcome Screen when all files are closed and the current project is invalid.
- [x] Rectractable project tree pane on Alt+0.
- :no_entry: Some ♥️ to Git support
  - [x] Git checkout.
  - [x] Git log.
  - [x] Show git locator at ALT+G
  - [x] Git blame (ugly way, not in editor gutter)

## 0.3.0 release

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
- [ ] Add retractable output pane, default hidden until ALT+1 or an error, hidden on ESC.

## 0.5.0 release

- [ ] :fire: Fix GC issue :fire:, this is the project major issue, Crystal GC doesn't like GTK.

## Backlog

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

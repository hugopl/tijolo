<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order. Things I'm already working on have a :no_entry:.

## 0.1.0 release

- [x] This TODO list.
- [x] Fix file monitoring that barely works now.
- [x] Warn about files changed externally.
- [x] Open files with cursor position where it was when closed last time.
- [x] Separate config file from rc file.
- [x] Click on editor-header show options to copy file path to clipboard.
- [x] Show locator helper when more locators exists.
- [x] Start language servers when opening a project.
- [x] Add non-project mode (a.k.a. lazzy project load)
- [x] Text find.
- [x] Remove open files view and make it only show at Ctrl+Tab press.
- [x] Show useful git info in the space where now is the open files view.
- [x] Ubuntu packages.
- [x] Use TOML for the configuration file.
- [x] Settings "UI", just open config file and tell about syntax errors on save

## Probably Post 0.1.0 release

- [ ] Rectractable project tree pane on Alt+0.
- [ ] :fire: Fix GC issues :fire:
- [ ] Text find/replace (study something maybe vim style, but simpler and more intuitive).
- [ ] Clone repository dialog.
- [ ] :no_entry: Better feedback when failed to open language servers.
- [ ] Save sessions, with a config flag.
- [ ] Add retractable output pane, default hidden until ALT+1 or an error, hidden on ESC.
- [ ] Location history, Ctrl+Alt+➡️/Ctrl+Alt+⬅️ navigate through cursor location history.
- [ ] :no_entry: Split screen
  - [ ] :no_entry: Ctrl+Shift+P open locator targeting a split view.
  - [ ] Ctrl+Shift+X "zoom" view.
  - [ ] Alt + arrows change from one split view to another.
  - [ ] Ctrl+T split view opening a terminal.
- [ ] I18N support.
- [ ] Smart indent (language specific) or check if using LSP is ok.
- [ ] Notification system for things like "LSP for language X ready!".
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] Git menu (Study if locator commands can be used)
- [ ] In-editor git blame.
- [ ] Git log.
- [ ] Git locator for checkout branches and commit
  - [ ] Trigged by "g "
  - [ ] Model filled with "checkout <branch>"
  - [ ] Model filled with "blame", "log", "commit", How to do git log on current file?

## When Crystal coding is done

- Check why GTK markdown syntax is so slow at first load.
- Check why GTK CSS syntax is so slow at first load.
- Subclass GTK TextView class to try to implement multiple cursors

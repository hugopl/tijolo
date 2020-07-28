<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order. Things I'm already working on have a :no_entry:.

## Probably before 0.1.0 release

- [x] This TODO list.
- [x] Fix file monitoring that barely works now.
- [ ] :no_entry: Warn about files changed on mainwindow focus in.
- [x] Open files with cursor position where it was when closed last time.
- [x] Separate config file from rc file.
- [x] Click on editor-header show options to copy file path to clipboard.
- [x] Show locator helper when more locators exists.
- [ ] LSP
  - [x] Start language servers when opening a project.
  - [ ] :no_entry: Better feedback when failed to open language servers.
- [ ] Add non-project mode, by creating a FakeProject obj.
- [ ] Clone repository dialog.
- [x] Text find.
- [ ] Text find/replace.
- [ ] :no_entry: Split screen
  - [ ] :no_entry: Ctrl+Shift+P open locator targeting a split view.
  - [ ] Ctrl+Shift+X "zoom" view.
  - [ ] Alt + arrows change from one split view to another.
  - [ ] Ctrl+T split view opening a terminal.
- [ ] Smart indent (language specific) or check if using LSP is ok.
- [ ] :fire: Fix GC issues :fire:

## UI Planned Changes

- [ ] Remove open files view an dmake it show only at Ctrl+Tab press.
- [ ] Show useful git info in the space where not is the open files view.
- [ ] Add retractable output pane, default hidden until ALT+1 or an error, hidden on ESC.

## Probably Post 0.1.0 release

- [ ] Notification system for things like "LSP for language X ready!"
- [ ] Rectractable project tree pane.
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] Settings UI.
- [ ] Git menu (Study if locator commands can be used)
- [ ] In-editor git blame.
- [ ] Git log.
- [ ] Git locator for checkout branches and commit
  - [ ] Trigged by "g "
  - [ ] Model filled with "checkout <branch>"
  - [ ] Model filled with "blame", "log", "commit", How to do git log on current file?

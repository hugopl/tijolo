<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order.

## 0.5.0 release

- Some ♥️ to LSP implementation.
  - [ ] Support LSP auto-complete feature.
  - [ ] Support LSP diagnostics feature.
  - [x] Better feedback on LSP when it fails, when it's ready, etc.
- Some ♥️ to file monitoring.
  - [x] Better handle file renames by external processes.
  - [x] Better handle file removal by external processes.
  - [x] Work with non-project files open.
- [ ] Fix the buggy location history introduced into 0.3.0 :-)
- [x] More ♥️ to text search UI.
- [x] Add find/replace.
- [x] Add search by regexp.

## 0.6.0 release

- [ ] 🔥️Fix GC issue🔥️, this is the project major issue, Crystal GC doesn't like GtkSourceView and just crash, any help would be appreciated here.

I have a plan (and few POC code) to write my own text widget, so this would fix this issue once and for all plus allow some
stuff that nowadays is impossible or very hard to do using GtkSourceView.

## Backlog, things that can go in any version...

- [ ] Implement keyboard focused open dialog like Howl editor.
- [ ] Git commit dialog? Not sure yet if this is needed when there are terminal views all around.
- [ ] Rebind shortcuts after save config file.
- [ ] Rename files.
- [ ] Delete files.
- [ ] Clone repository dialog. (I really don't care about this task, since I don't use it)
- [ ] Automatic close open files not used for a long time.
- [ ] Save sessions.
- [ ] I18N support.
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame.
- [ ] Write a text widget in Crystal and use it instead of GtkSourceView4 😱️, get some inspiration from Howl editor.

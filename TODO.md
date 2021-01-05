<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order.

## 0.4.0 release

- [x] Maximinize split view on Ctrl+Shift+X.
- Some ♥️ to LSP implementation.
  - [x] Make it work with yaml-language-server.
  - [x] Make it work with ccls language-server.
  - [x] Make it work with whatever language-server.
  - [ ] Support LSP auto-complete feature.
  - [ ] Support LSP diagnostics feature.
  - [ ] Better feedback on LSP when it fails, when it's ready, etc.
- Some ♥️ to file monitoring.
  - [ ] Better handle file renames by external processes.
  - [ ] Better handle file removal by external processes.
  - [ ] Work with non-project files open.
- [ ] Fix the buggy location history introduced into 0.3.0 :-)
- [ ] Text find/replace (study something maybe vim style, but simpler and more intuitive).
- [ ] Better feedback when failed to open language servers.
- [x] Editorconfig support
- [x] Checkout git branch by clicking on branch in sidebar.

## 0.5.0 release

- [ ] 🔥️Fix GC issue🔥️, this is the project major issue, Crystal GC doesn't like GTK and just crash, any help would be appreciated here.

## Backlog, things that can go in any version...

- [ ] Git commit dialog? Not sure yet if this is needed when there are terminal views all around.
- [ ] Rebind shortcuts after save config file.
- [ ] Rename files.
- [ ] Delete files.
- [ ] Show LSP diagnostics.
- [ ] Support folding (there's a very simple folding implementation in TEPL, just get it and use with LSP)
- [ ] Clone repository dialog. (I really don't care about this task, since I don't use it)
- [ ] Save sessions.
- [ ] I18N support.
- [ ] Show passive popup "definition not found" when LSP can't find a definition.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame (maybe should better wait for GTK4 before dig into GTK drawing functions)
- [ ] Subclass/fork GTK TextView class to try to implement multiple cursors, maybe in Crystal with a lot of C glue.
- [ ] Write a text widget in Crystal and use it instead of GtkSourceView4 😱️, get some inspiration from Howl editor.

<img align="left" src="./icons/tijolo.svg" width="100" height="100" />

# Tijolo Tasks

This is a short-term TODO list in no special order.

## 0.5.0 release

- [ ] Port to Crystal 0.36.1 (i.e. fix https://github.com/jhass/crystal-gobject/issues/82)
- [ ] Fix the buggy location history introduced into 0.3.0 :-)
- Some ♥️ to LSP implementation.
  - [x] Better feedback on LSP when it fails, when it's ready, etc.
  - [x] Show passive popup "definition not found" when LSP can't find a definition.
- Some ♥️ to file monitoring.
  - [x] Better handle file renames by external processes.
  - [x] Better handle file removal by external processes.
  - [x] Work with non-project files open.
- [x] More ♥️ to text search UI.
- [x] Add find/replace.
- [x] Add search by regexp.

## 0.6.0 release

Tijolo need to disable the GC to work without crash, this is due to a bug in the way Crystal uses the GC:

- https://github.com/jhass/crystal-gobject/issues/69
- https://github.com/crystal-lang/crystal/issues/9226

I have some weak clues that this bug seems to be related to GtkSourceView (GSV) and their language engine, since the engine
create some threads and those threads are not registered on BoehmGC. Some attempts to register these threads were made
without much success, so I'm going into a more painful approach to fix the issue:

- [ ] Test again using Tijolo without loading any GtkSourceView language, i.e. do not use the GSV, and see if it doesn't crash.
  - I did this tests already and it worked, but I need to do it again to be sure.
- [ ] Implement a language engine in Crystal (probably using [GtkSourceView format](https://developer.gnome.org/gtksourceview/stable/lang-reference.html)).
- [ ] Use this language engine into GtkSourceView widget.
  - At this point I can think about drop GtkSourceView and use bare GtkTextView.
- [ ] If I few brave enough, create a code-focused GTK text widget that can load huge files and is fast enough.
  - [This post](https://howl.io/blog/2016/05/26/introducing-aullar.html) encouraged me, so sad their editor was wrote in a
    weird language (says the guy writting Crystal code).
- [ ] Be back on track of adding more features, mainly LSP related ones.

This doesn't mean the editor will be dead until I finish all this, since I use Tijolo on daily basis, bugs and small features
that make my daily work easier will for sure still be implemented, but I'm going to try to avoid implementing features that
depend on GtkSourceView.

## Backlog, things that can go in any version...

- [ ] Bufferize text modifications before send to the language server, I guess VSCode does that.
- [ ] Notify users that a language serve doesn't support incremental update.
- [ ] Implement keyboard focused open dialog like Howl editor.
- [ ] Pass Ctrl+Key keystrokes to terminal views.
- [ ] Close all views on Ctrl+Shift+W.
- [ ] Open more than one file on command line, `tijolo file1 file2`.
- [ ] Show user configured shortcuts in help texts instead of hardcoded text with default shortcuts.
- Some ♥️ to LSP implementation.
  - [ ] Support LSP auto-complete feature.
  - [ ] Support LSP diagnostics feature.
  - [ ] Support LSP code format feature.
- [ ] Git commit dialog? Not sure yet if this is needed when there are terminal views all around.
- [ ] Rebind shortcuts after save config file.
- [ ] Rename files (not sure about this... maybe a mouse-only action? since it's a rarely used action for a shortcut).
- [ ] Delete files (not sure about this... maybe a mouse-only action? since it's a rarely used action for a shortcut).
- [ ] Clone repository dialog. (I really don't care about this task, since I don't use it)
- [ ] Automatic close open files not used after X keystrokes
- [ ] Save sessions.
- [ ] I18N support.
- [ ] Strip trailing whitespaces (ONLY) from modified lines.
- [ ] In-editor git blame.

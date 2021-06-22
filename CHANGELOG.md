# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - 2021-06-22
### Added
 - On Welcome Window, trigger a projects rescan on F5.
### Fixed
 - Fixed regression on 0.6.0 that caused maximize view action stop working.
 - Fixed GTK warnings when renaming files/changing git branches.
 - Restore cursor position when re-opening a file.
 - Set the cursor position to match current view cursor position on `git blame` command.

## [0.6.0] - 2021-04-19
### Fixed
 - Fixed some issues when switching views when using split views.
### Changed
 - When switching views, a split view indicator is show, so you know where are you going.
 - Restore split views state after finish Ctrl+Tab navigation (i.e. changing just the split you choose).

## [0.5.1] - 2021-04-11
### Fixed
 - Add  makefile `--ignore-crystal-version` to Makefile

## [0.5.0] - 2021-04-11
### Added
 - Improve Ctrl+Tab on multiple splits by prioritizing views in the current split.
 - Reverse Ctrl+Tab on Ctrl+` (on US keyboards), unfortunately no yet configurable.
 - Add fuzzy search to Welcome Screen and improve its keyboard usability.
 - Added copy/paste on terminal view on Ctrl+Shift+C/Ctrl+Shift+V.
 - Add `Find By Regexp`, triggered on `CTRL+R`.
 - Add `Find/Replace`, triggered on `CTRL+H`.
 - Added passive notification to inform things like when a language server crashed or is ready.
 - Show a notification when no definition is found triggering _go to definition_ action.
### Changed
 - Some ♥️ to find/replace UI.
### Fixed
 - Fixed compilation with Crystal 0.36.x and 1.0.0.
 - Fix some keyboard focus issues with find/replace widget.
 - Monitor file changes/renames of open non-project files.
 - Only scroll view on text find if the match isn't in the viewport.

## [0.4.1] - 2021-01-11
### Fixed
 - Focus editor if press ESC on locator.
 - Do not let the editor useless on language server crashes.
 - Do not show previous locator results after close the last editor and hit Ctrl+P.

## [0.4.0] - 2021-01-10
### Added
 - When using split views, hit Ctrl+Shift+X to maximized the current view and let it tak all screen space.
 - Add .editorconfig support.
 - Use a login shell by default on terminals (configurable).
 - Added default configuration for ccls C/C++/ObjectiveC language server.
 - Added default configuration for yaml-language-server.
 - Added options to copy relative file path on editor header.
 - Show an user friendly message when no git projects were found.
 - Clicking on a branch name on `Git Branches` view changes the current branch.
 - Added `--no-lsp` to disable LSP suport.
 - Automatic reload files if they were changed externally but are up to date on git.
 - Added syntax highlighting to git log output.
### Fixed
 - Don't show popup menu when clicking on editor bar on terminal views or unsaved files.
 - Fix bad CSS on save/open dialog painting tree views.
 - Correct show project relative path on new saved files on editor header bar.
 - Log to `/tmp/tijolo.PID.log` when not running on a tty and user didn't pass --logfile. (regression)
 - Fix several issues in LSP implementation.
 - Added some ♥️ into Ruby and Crystal syntax highlighting language specs.
 - Fixed some issues sorting the last used view when switching between views.
 - Clicking on a terminal or image view now proper focus them.

## [0.3.0] - 2020-11-02
### Added
 - log_level is now configurable via config file.
 - Cursor position history, not working well yet 😕️. Triggered on Alt+Shift+⬅️/Alt+Shift+➡️.
 - Split views!
   - Ctrl+Shift+P open the locator causing the result to be possibly opened by spliting the current view.
   - Shift+F2 go to symbol definition possibly (if file isn't already open) opened by spliting the current view.
   - Ctrl+Shift+O open an external file spliting the current view.
   - Use ALT+Arrows to navigate through split views.
 - Basic image view, *really* basic.
 - Silent reload readonly open files when they are externally modified.
 - Load the right syntax-highlighting when saving a new file first time or saving as another file name.
 - Embedded terminal! Using VTE, works like any other view, Ctrl+T opens a terminal view in a new split.
 - Make some text editor parameters configurable (line wrap, tabwidth, font size, etc...)
 - Added shortcut to increase/decrease text editor font size, Ctrl+-/Ctrl+=.

### Changed
 - Show tree lines on project tree.
 - New files are initially marked as non-modified.
 - Language servers can be disabled in config files by letting then with empty strings

### Fixed
 - Don't crash if project directory is removed while Tijolo is open.
 - Starting Tijolo and doing Ctrl+N, Ctrl+W, Ctrl+N works, and I'm too lazy to translate this into a better sentence.
 - Don't comment last line in multi-line code comment if there's no characters selected.
 - Fix detection of Dockerfiles.

## [0.2.0] - 2020-09-13
### Added
 - Open button on header bar, so you can open/create new file at welcome screen.
 - Recent files button on header bar to fast open last 10 non-project files opened.
 - LSP symbols are now cached for faster locator contents load when there's no file changes.
 - Added default configuration for bash language server.
 - New Git locator, triggered on ALT+G or typing "g " on locator
   - git log (basic... without syntax highlighting and not possible to navigate and see the commit diffs)
   - git blame (basic... just show the output in a buffer, the future plan is to show it on editor gutter)
   - git checkout (only for local branches)
 - Default logfile to /tmp/tijolo.#{pid}.log if STDOUT isn't a tty.
 - Show/Hide Project Tree pane on Alt+0.
 - Focus editor on Alt+1.
 - Added Output pane, show/hide on Alt+2, currently it only show Tijolo logs.

### Fixed
 - Missing config entries are filled up with defaults.
 - It's now possible to go back to welcome screen after close all files if there's no project open.
 - Fixes on LSP protocol implementation, so more language servers should work with Tijolo.
 - Git branches are now updated on UI when just the HEAD changes.
 - Do not repeated show "File was externally modified" dialog when user press cancel.
 - Correctly set "transient_for" property on dialogs, i.e. dialogs behave as expected regarding focus.
 - Do not crash if try to reload a deleted file.
 - LSP do not stop working if receive a bad or not supported message from server (Error is show on output pane - Alt+2).
 - Use g_idle_add instead of g_timeout(0), so some inter-thread stuff like LSP is much faster.

## [0.1.1] - 2020-08-19
### Fixed
 - Don't crash at startup if ~/.config/tijolo directory doesn't exist.
 - Fix compilation with HarfBuzz 2.7.1.
 - Fix app URL on about dialog.

## [0.1.0] - 2020-08-09
### Added
 - Everything! Initial Release.

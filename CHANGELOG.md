# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
### Added
 - log_level is now configurable via config file.
 - Cursor position history! Triggered on Alt+Shift+⬅️/Alt+Shift+➡️.
 - Split views!!
   - Ctrl+Shift+P open the locator causing the result to be possibly opened by spliting the current view
   - Shift+F2 go to symbol definition possibly (if file isn't already open) opened by spliting the current view

### Changed
 - Show tree lines on project tree.
 - New files are initially marked as non-modified.

### Fixed
 - Don't crash if project directory is removed while Tijolo is open.

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

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
## Added
 - Open button on header bar, so you can open/create new file at welcome screen.
 - Recent files button on header bar to fast open last 10 non-project files opened.
 - LSP symbols are now cached for faster locator contents load when there's no file changes.
 - Added default configuration for bash language server.
 - New Git locator, triggered on ALT+G or typing "g " on locator (only basic git log and checkout commands)
 - Default logfile to /tmp/tijolo.#{pid}.log if STDOUT isn't a tty.

## Fixed
 - Missing config entries are filled up with defaults.
 - It's now possible to go back to welcome screen after close all files if there's no project open.
 - Fixes on LSP protocol implementation, so more language servers should work with Tijolo.
 - Git branches are now updated on UI when just the HEAD changes.
 - Don't crash at startup if ~/.config/tijolo directory doesn't exist.
 - Fix app URL on about dialog.

## [0.1.0] - 2020-08-09
### Added
 - Everything! Initial Release.

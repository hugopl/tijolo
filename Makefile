.PHONY: all debug install install-fonts uninstall uninstall-fonts
PREFIX ?= /usr

all:
	shards build --ignore-crystal-version --release -s  -Dpreview_mt
debug:
	shards build --ignore-crystal-version --debug -Dpreview_mt
test:
	# Some tests need en_US locale to pass on string to float convertions: "1.23" vs "1,23".
	GC_DONT_GC=1 LC_ALL=en_US.UTF8 xvfb-run crystal spec

install:
	install -D -m 0755 bin/tijolo $(DESTDIR)$(PREFIX)/bin/tijolo
	install -D -m 0644 tijolo.desktop $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	install -D -m 0644 icons/tijolo.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	# Data
	install -D -m0644 data/language-specs/crystal.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/crystal.lang
	install -D -m0644 data/language-specs/ruby.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/ruby.lang
	install -D -m0644 data/language-specs/haml.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/haml.lang
	install -D -m0644 data/language-specs/gitlog.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/gitlog.lang
	install -D -m0644 data/styles/monokai.xml $(DESTDIR)$(PREFIX)/share/tijolo/styles/monokai.xml
	# License
	install -D -m0644 LICENSE $(DESTDIR)$(PREFIX)/share/licenses/tijolo/LICENSE
	# Changelog
	install -D -m0644 CHANGELOG.md $(DESTDIR)$(PREFIX)/share/doc/tijolo/CHANGELOG.md
	gzip -9fn $(DESTDIR)$(PREFIX)/share/doc/tijolo/CHANGELOG.md

install-fonts:
	install -d $(DESTDIR)$(PREFIX)/share/fonts/jetbrains-mono
	install -D -m0644 data/fonts/*.ttf $(DESTDIR)$(PREFIX)/share/fonts/jetbrains-mono
	install -D -m0644 data/fonts/LICENSE $(DESTDIR)$(PREFIX)/share/licenses/jetbrains-mono/LICENSE

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/tijolo
	rm -f $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	rm -rf $(DESTDIR)$(PREFIX)/share/tijolo
	rm -rf $(DESTDIR)$(PREFIX)/share/licenses/tijolo
	rm -rf $(DESTDIR)$(PREFIX)/share/doc/tijolo

uninstall-fonts:
	rm -rf $(DESTDIR)$(PREFIX)/share/fonts/jetbrains-mono
	rm -rf $(DESTDIR)$(PREFIX)/share/licenses/jetbrains-mono

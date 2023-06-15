.PHONY: all debug test install install-fonts uninstall uninstall-fonts
PREFIX ?= /usr

all:
	shards build --release -s  -Dpreview_mt --ignore-crystal-version
debug:
	shards build --debug -Dpreview_mt --ignore-crystal-version
test:
	# Some tests need en_US locale to pass on string to float convertions: "1.23" vs "1,23".
	@if [ "$$(uname -s)" == "Darwin" ]; then\
	  GC_DONT_GC=1 crystal spec;\
	else\
	  GC_DONT_GC=1 LC_ALL=en_US.UTF8 xvfb-run crystal spec;\
	fi

install:
	install -D -m 0755 bin/tijolo $(DESTDIR)$(PREFIX)/bin/tijolo
	install -D -m 0644 tijolo.desktop $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	install -D -m 0644 icons/tijolo.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	# Settings schema
	install -D -m644 data/gschema.xml $(DESTDIR)$(PREFIX)share/glib-2.0/schemas/io.github.hugopl.Tijolo.gschema.xml
	# Data
	install -D -m0644 data/styles/default.yaml $(DESTDIR)$(PREFIX)/share/tijolo/styles/default.yaml
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

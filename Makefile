.PHONY: all configure test debug install post-install install-fonts uninstall uninstall-fonts
PREFIX ?= /usr
CR_FLAGS ?= -Dstrict_multi_assign -Duse_pcre2 -Dpreview_overload_order

all: .WAIT configure
	shards build --release $(CR_FLAGS) -s --link-flags='-Wl,--as-needed'

configure:
	shards install
	./bin/gi-crystal

test:
	# Some tests need en_US locale to pass on string to float convertions: "1.23" vs "1,23".
	@if [ "$$(uname -s)" == "Darwin" ]; then\
	  LC_ALL=en_US.UTF8 crystal spec $(CR_FLAGS);\
	else\
	  LC_ALL=en_US.UTF8 xvfb-run crystal spec $(CR_FLAGS);\
	fi

debug:
	shards build --debug $(CR_FLAGS) -s --error-trace

install:
	install -D -m 0755 bin/tijolo $(DESTDIR)$(PREFIX)/bin/tijolo
	install -D -m 0644 tijolo.desktop $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	install -D -m 0644 data/io.github.hugopl.Tijolo.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	# Settings schema
	install -D -m644 data/gschema.xml $(DESTDIR)$(PREFIX)/share/glib-2.0/schemas/io.github.hugopl.Tijolo.gschema.xml
	# Data
	install -D -m0644 data/styles/default.yaml $(DESTDIR)$(PREFIX)/share/tijolo/styles/default.yaml
	install -D -m0644 data/styles/monokai.xml $(DESTDIR)$(PREFIX)/share/tijolo/styles/monokai.xml
	cp -r data/icons $(DESTDIR)$(PREFIX)/share/tijolo/

	# License
	install -D -m0644 LICENSE $(DESTDIR)$(PREFIX)/share/licenses/tijolo/LICENSE
	# Changelog
	install -D -m0644 CHANGELOG.md $(DESTDIR)$(PREFIX)/share/doc/tijolo/CHANGELOG.md
	gzip -9fn $(DESTDIR)$(PREFIX)/share/doc/tijolo/CHANGELOG.md
	# GtkSourceView language files
	install -D -m0644 data/language-specs/crystal.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/crystal.lang
	install -D -m0644 data/language-specs/ruby.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/ruby.lang
	install -D -m0644 data/language-specs/haml.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/haml.lang
	install -D -m0644 data/language-specs/gitlog.lang $(DESTDIR)$(PREFIX)/share/tijolo/language-specs/gitlog.lang

post-install:
	gtk4-update-icon-cache --ignore-theme-index $(DESTDIR)$(PREFIX)/share/icons/hicolor
	glib-compile-schemas $(DESTDIR)$(PREFIX)/share/glib-2.0/schemas

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

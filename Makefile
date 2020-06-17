.PHONY: all install uninstall

all:
	shards build --release -Dpreview_mt
debug:
	shards build -Dpreview_mt
install:
	install -D -m 0755 bin/tijolo $(DESTDIR)$(PREFIX)/bin/tijolo
	install -D -m 0444 tijolo.desktop $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	install -D -m 0444 icons/tijolo.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	# Crystal language spec, will be pushed upstream at the right time.
	install -D -m0444 data/crystal.lang $(DESTDIR)$(PREFIX)/share/gtksourceview-4/language-specs/crystal.lang
	# Monokai theme
	install -D -m0444 data/monokai.xml $(DESTDIR)$(PREFIX)/share/gtksourceview-4/styles/monokai.xml

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/tijolo
	rm -f $(DESTDIR)$(PREFIX)/share/applications/io.github.hugopl.Tijolo.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/io.github.hugopl.Tijolo.svg
	rm -f $(DESTDIR)$(PREFIX)/share/gtksourceview-4/language-specs/crystal.lang
	rm -f $(DESTDIR)$(PREFIX)/share/gtksourceview-4/styles/monokai.xml

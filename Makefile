PREFIX ?= /usr/local/lib/onekvm/extensions/wireguard
VERSION ?= 0.1.0
ARCH ?= unknown

.PHONY: install
install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 0755 onekvm-wireguard $(DESTDIR)$(PREFIX)/bin/onekvm-wireguard
	install -d $(DESTDIR)$(PREFIX)/web
	install -m 0644 web/logo.svg $(DESTDIR)$(PREFIX)/web/logo.svg
	sed -e 's/@VERSION@/$(VERSION)/g' -e 's/@ARCH@/$(ARCH)/g' manifest.json.in > $(DESTDIR)$(PREFIX)/manifest.json
	chmod 0644 $(DESTDIR)$(PREFIX)/manifest.json

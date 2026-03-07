getprop = $(shell grep "^$(1)=" module.prop | head -n1 | cut -d'=' -f2)

MODNAME ?= $(call getprop,id)
MODVER ?= $(call getprop,version)
ZIP = $(MODNAME)-$(MODVER).zip

all: $(ZIP)

zip: $(ZIP)

%.zip: clean
	zip -r9 $(ZIP) . -x $(MODNAME)-*.zip LICENSE CLAUDE.md README.md CHANGELOG.md CHECKLIST.md update.json .gitignore .gitattributes Makefile /hooks/* /.git* /.claude*

install: $(ZIP)
	adb push $(ZIP) /sdcard/
	echo '/data/adb/magisk/busybox unzip -p "/sdcard/$(ZIP)" META-INF/com/google/android/update-binary | /data/adb/magisk/busybox sh /proc/self/fd/0 x x "/sdcard/$(ZIP)"' | adb shell su -c sh -
	adb shell rm -f "/sdcard/$(ZIP)"

clean:
	rm -f *.zip

setup:
	ln -sf ../../hooks/pre-commit .git/hooks/pre-commit

update:
	curl -L https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh > META-INF/com/google/android/update-binary

.PHONY: all zip install clean setup update

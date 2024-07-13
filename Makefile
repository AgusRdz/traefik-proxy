SUBDIRS := traefik whoami laravel1 laravel2 laravel3 laravel4

.PHONY: all install $(SUBDIRS)

all: install

install: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ install
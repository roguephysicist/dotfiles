DOTREPO := $(shell pwd)
DIR_APP := $(DOTREPO)/rc.d
DIR_TRG := $(HOME)

RCFILES := $(shell ls -A $(DIR_APP))

TARGETS := $(addprefix $(DIR_TRG)/., $(RCFILES))
TARGETS += $(addprefix $(DIR_TRG)/, .bashrc)
TARGETS += $(addprefix $(DIR_TRG)/, .bash_profile)

.PHONY: help

help:
	@echo 'Usage:								'
	@echo '	make linux --> dotfiles for Linux	'
	@echo '	make macos --> dotfiles for macOS	'
	@echo '	make clean --> unlink all files		'

common:
	@for f in $(RCFILES); do ln -si $(DIR_APP)/$$f $(DIR_TRG)/.$$f; done

linux: | common
	@ln -si $(DOTREPO)/bash.linux	$(DIR_TRG)/.bashrc

macos: | common
	@ln -si $(DOTREPO)/bash.macos	$(DIR_TRG)/.bash_profile

clean:
	@for f in $(TARGETS); do if [ -h $$f ]; then rm -i $$f; fi ; done

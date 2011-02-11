PREFIX  ?= /usr/local

main_dir = ${DESTDIR}${PREFIX}
lib_dir  = ${main_dir}/lib

all:
	@echo "There is nothing to make, you can just make install"

install:
	@echo installing lib/ssh-forcecommand to ${lib_dir}
	@mkdir -p ${lib_dir}
	@cp lib/ssh-forcecommand ${lib_dir}
	@chmod 755 ${lib_dir}/ssh-forcecommand

uninstall:
	rm -f ${lib_dir}/ssh-forcecommand

.PHONY: all install uninstall

include config.mk

SRC = dwmstatus.c
OBJ = ${SRC:.c=.o}

all: options dwmstatus

options:
	@echo dwmstatus build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.mk

dwmstatus: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f dwmstatus ${OBJ}

.PHONY: all options clean

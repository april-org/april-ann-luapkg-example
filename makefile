PREFIX = /usr
INCLUDE := $(PREFIX)/include
LIB := $(PREFIX)/lib
LUALIB := $(PREFIX)/lib/lua/5.2
LUAMOD := $(PREFIX)/share/lua/5.2
BIN := $(PREFIX)/bin

ALL: release

release:
	lua profile_build_scripts/build_release.lua

INCLUDE_NO_WS := $(shell echo "$(INCLUDE)" | sed 's/ //g')
LIB_NO_WS := $(shell echo "$(LIB)" | sed 's/ //g')
LUALIB_NO_WS := $(shell echo "$(LUALIB)" | sed 's/ //g')
LUAMOD_NO_WS := $(shell echo "$(LUAMOD)" | sed 's/ //g')
BIN_NO_WS := $(shell echo "$(BIN)" | sed 's/ //g')

check-env-vars:
ifneq ("$(INCLUDE_NO_WS)","$(INCLUDE)")
	@echo "Unable to work with whitespaces in PREFIX, INCLUDE, LIB, LUALIB, LUAMOD, BIN env vars"
	@exit 3
endif
ifneq ("$(LIB_NO_WS)","$(LIB)")
	@echo "Unable to work with whitespaces in PREFIX, INCLUDE, LIB, LUALIB, LUAMOD, BIN env vars"
	@exit 4
endif
ifneq ("$(LUALIB_NO_WS)","$(LUALIB)")
	@echo "Unable to work with whitespaces in PREFIX, INCLUDE, LIB, LUALIB, LUAMOD, BIN env vars"
	@exit 5
endif
ifneq ("$(LUAMOD_NO_WS)","$(LUAMOD)")
	@echo "Unable to work with whitespaces in PREFIX, INCLUDE, LIB, LUALIB, LUAMOD, BIN env vars"
	@exit 6
endif
ifneq ("$(BIN_NO_WS)","$(BIN)")
	@echo "Unable to work with whitespaces in PREFIX, INCLUDE, LIB, LUALIB, LUAMOD, BIN env vars"
	@exit 7
endif

clean:
	rm -Rf build_*

install: check-env-vars uninstall
	@mkdir -p $(LUALIB)
	install lib/libexample.so $(LIB)
	install lib/example.so $(LUALIB)

uninstall: check-env-vars
	@rm -f $(LUALIB)/example.so
	@rm -f $(LIB)/libexample.so

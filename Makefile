OPTEE_PATH        ?= $(CURDIR)/rust-optee-trustzone-sdk/optee
OPTEE_BUILD_PATH  ?= $(OPTEE_PATH)/build
OPTEE_OS_PATH     ?= $(OPTEE_PATH)/optee_os
OPTEE_CLIENT_PATH ?= $(OPTEE_PATH)/optee_client
VENDOR            ?= rpi3.mk

all: toolchains optee-os optee-client hello_world
optee: toolchains optee-os optee-client

toolchains:
	make -C $(OPTEE_BUILD_PATH) -f $(VENDOR) toolchains

optee-os:
	make -C $(OPTEE_BUILD_PATH) -f $(VENDOR) optee-os

optee-client:
	make -C $(OPTEE_BUILD_PATH) -f $(VENDOR) optee-client-common

hello_world:
	mkdir -p out
	make -s -C hello_world
	make -s -C ta
	cp hello_world/target/aarch64-unknown-linux-gnu/release/hello_world out
	cp ta/target/aarch64-unknown-linux-gnu/release/224b49fd-9556-4b7a-8bad-3a1dd86bac6b.ta out

optee-os-clean:
	make -C $(OPTEE_OS_PATH) O=out/arm clean

optee-client-clean:
	make -C $(OPTEE_BUILD_PATH) -f $(VENDOR) optee-client-clean-common

hello_world-clean:
	rm -rf out
	make -s -C hello_world clean
	make -s -C ta clean

.PHONY: clean optee-os-clean optee-client-clean hello_world hello_world-clean

clean: optee-os-clean optee-client-clean hello_world-clean

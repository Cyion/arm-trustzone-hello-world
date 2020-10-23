NAME := hello_world

OPTEE_DIR ?= ../rust-optee-trustzone-sdk/optee

OPTEE_BIN := $(OPTEE_DIR)/toolchains/aarch64/bin
OBJCOPY := $(OPTEE_BIN)/aarch64-linux-gnu-objcopy
TARGET := aarch64-unknown-linux-gnu

OUT_DIR := $(CURDIR)/target/$(TARGET)/release


all: host strip

host:
	@cargo build --target $(TARGET) --release

strip:
	@$(OBJCOPY) --strip-unneeded $(OUT_DIR)/$(NAME) $(OUT_DIR)/$(NAME)

clean:
	@cargo clean

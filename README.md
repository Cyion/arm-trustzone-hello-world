# arm-trustzone-hello-world

Rust OP-TEE TrustZone "Hello World" Example.

## Getting started

To get started, you need to clone the project, initialize related submodules,
and install building dependencies (The complete list of prerequisites can be found here: [OP-TEE Prerequisites](https://optee.readthedocs.io/en/latest/building/prerequisites.html)).

``` sh
# clone the project and initialize related submodules
$ git clone https://github.com/Cyion/arm-trustzone-hello-world.git
$ git submodule update --init
$ cd rust-optee-trustzone-sdk
$ git submodule update --init
$ (cd rust/compiler-builtins && git submodule update --init libm)
$ (cd rust/rust && git submodule update --init src/stdsimd src/llvm-project)

# install dependencies
$ sudo apt-get install android-tools-adb android-tools-fastboot autoconf \
        automake bc bison build-essential ccache cscope curl device-tree-compiler \
        expect flex ftp-upload gdisk iasl libattr1-dev libc6:i386 libcap-dev \
        libfdt-dev libftdi-dev libglib2.0-dev libhidapi-dev libncurses5-dev \
        libpixman-1-dev libssl-dev libstdc++6:i386 libtool libz1:i386 make \
        mtools netcat python-crypto python3-crypto python-pyelftools \
        python3-pycryptodome python3-pyelftools python-serial python3-serial \
        rsync unzip uuid-dev xdg-utils xterm xz-utils zlib1g-dev

# install Rust and select a proper version
$ curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly-2019-07-08
$ source $HOME/.cargo/env
$ rustup component add rust-src && rustup target install aarch64-unknown-linux-gnu arm-unknown-linux-gnueabihf

# install Xargo
$ rustup default 1.44.0 && cargo +1.44.0 install xargo
# switch to nightly
$ rustup default nightly-2019-07-08
```

Then, download ARM toolchains and build OP-TEE libraries. Note that the OP-TEE
target is Raspberry Pi 3, and you can modify the Makefile to other targets accordingly:

``` sh
$ make optee
```

Build app:

``` sh
$ make hello_world
```
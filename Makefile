# Detect the operating system
OS := $(shell uname)

.PHONY: all
all: setup format build

# Automatically select the correct setup target based on the OS
.PHONY: setup
setup:
ifeq ($(OS), Linux)
	$(MAKE) setup-debian
else ifeq ($(OS), Darwin)
	$(MAKE) setup-mac
else
	@echo "Unsupported OS: $(OS)"
endif

.PHONY: setup-debian
setup-debian:
	mkdir -p build && \
	cd build && \
	apt-get update && \
	apt-get install -y software-properties-common libgtk-3-dev build-essential libglu1-mesa-dev freeglut3-dev mesa-common-dev clang-format && \
	wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.1/wxWidgets-3.2.1.tar.bz2 && \
	tar -xvjf wxWidgets-3.2.1.tar.bz2 && \
	cd wxWidgets-3.2.1 && \
	mkdir -p build-gtk && \
	cd build-gtk && \
	../configure --with-gtk=3 --enable-unicode --disable-shared --with-opengl && \
	make && \
	make install && \
	ldconfig && \
	cd ../../..

.PHONY: setup-mac
setup-mac:
	which brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
	brew update || true && \
	brew install wxwidgets cmake clang-format || true && \
	brew link --force wxwidgets || true && \
	export PKG_CONFIG_PATH=$$(brew --prefix wxwidgets)/lib/pkgconfig && \
	wx-config --version

.PHONY: format
format:
	clang-format src/* -i

.PHONY: build
build:
	mkdir -p build
	cd build && \
	cmake .. && \
	cmake --build .

.PHONY: debug
debug:
	mkdir -p build
	cd build && \
	cmake -DCMAKE_BUILD_TYPE=Debug .. && \
	make

.PHONY: clean
clean:
	rm -rf build

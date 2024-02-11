# Testing WASM Bridge from JS

## Setup

You can run `./setup.sh`

Install emscripten

```sh
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
cd ..
```
Setup versions

```sh
export LUA_VERSION=5.3.4
export LUAROCKS_VERSION=2.4.4
export PYTHON_VERSION=3.6.6
```

Install pyyaml

```sh
pip install pyyaml
```

Install Lua

```sh
curl -L http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar xzf -
cd lua-5.3.4
make linux test
sudo make install
cd ..
```

Install Luarocks

```sh
curl -L https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz | tar xzf -
cd luarocks-2.4.4
./configure
make build
sudo make install
```

Compile lua for wasm

```sh
cd lua-5.3.4
make clean
sudo make generic CC='emcc -s WASM=1'
cd ..
```

## Compiling Wasm

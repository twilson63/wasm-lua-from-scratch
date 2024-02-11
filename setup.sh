git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
cd ..

export LUA_VERSION=5.3.4
export LUAROCKS_VERSION=2.4.4
export PYTHON_VERSION=3.6.6

pip install pyyaml

curl -L http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar xzf -
cd lua-5.3.4
make linux test
sudo make install
cd ..

curl -L https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz | tar xzf -
cd luarocks-2.4.4
./configure
make build
sudo make install
cd ..

cd lua-5.3.4
make clean
make generic CC='emcc -s WASM=1'
cd ..

echo "add ./bin to your $PATH"
echo "then run emcc-lua in your example folder to build wasm"
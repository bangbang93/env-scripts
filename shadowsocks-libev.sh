F=$1
sudo yum install epel-release -y
sudo yum install git gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel libsodium-devel mbedtls-devel -y
cd ${F}
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh
./configure
CORE=`grep "model name" /proc/cpuinfo|wc -l`
CORE=$[CORE * 2]
make -j${CORE}
sudo make install

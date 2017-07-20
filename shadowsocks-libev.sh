yum install epel-release -y
yum install git gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel libsodium-devel mbedtls-devel -y
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
./autogen.sh
./configure
CORE=`grep "model name" /proc/cpuinfo|wc -l`
CORE=$[CORE * 2]
make -j${CORE}
make install

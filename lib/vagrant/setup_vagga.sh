if which vagga &> /dev/null; then
    echo "Vagga is already installed"
    exit 0
fi


if [ -f /etc/lsb-release ]; then
    # install uidmap in Ubuntu
    apt-get -qq install -y --force-yes uidmap
fi



VAGGA_VERSION=$(curl -s http://files.zerogw.com/vagga/latest-testing.html | sed -e 's/<[^>]*>//g' -e 's/vagga-//g' -e 's/.tar.xz//g')
echo "Latest Vagga version is $VAGGA_VERSION, installing..."

cd /tmp
curl -s "http://files.zerogw.com/vagga/vagga-${VAGGA_VERSION}.tar.xz" | tar -xJ
cd vagga
export PREFIX=/usr
bash install.sh

mkdir -p ~vagrant/.vagga

cat > ~vagrant/.vagga/settings.yaml << EOF
storage-dir: "/home/vagrant/"
EOF


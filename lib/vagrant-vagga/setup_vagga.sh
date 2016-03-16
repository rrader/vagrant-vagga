if which vagga &> /dev/null; then
    echo "Vagga is already installed"
    exit 0
fi
REPO=$1

if [ -f /etc/lsb-release ]; then
    # install uidmap in Ubuntu
    apt-get -qq install -y --force-yes uidmap
fi

echo "deb http://ubuntu.zerogw.com $REPO main" | sudo tee /etc/apt/sources.list.d/vagga.list

apt-get update
apt-get install vagga -y --force-yes

mkdir -p ~vagrant/.vagga

cat > ~vagrant/.vagga/settings.yaml << EOF
storage-dir: "/home/vagrant/"
EOF

chown -R vagrant:vagrant ~vagrant/.vagga

echo "Vagga installed successfully"

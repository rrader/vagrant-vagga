if which vagga &> /dev/null; then
    echo "Vagga is already installed"
    exit 0
fi
REPO=$1

if [ -f /etc/lsb-release ]; then
    # install uidmap in Ubuntu
    if ! apt-get -qq install -y --force-yes uidmap
    then
        # install uidmap manually on ubuntu 12.04
        wget http://gr.archive.ubuntu.com/ubuntu/pool/main/s/shadow/uidmap_4.1.5.1-1ubuntu9_amd64.deb
        dpkg -i uidmap_4.1.5.1-1ubuntu9_amd64.deb
    fi
fi

echo "deb http://ubuntu.zerogw.com $REPO main" | sudo tee /etc/apt/sources.list.d/vagga.list

apt-get update
apt-get install vagga -y --force-yes

mkdir -p ~vagrant/.vagga

echo "vagrant:100000:65536" > /etc/subuid
echo "vagrant:100000:65536" > /etc/subgid

cat > ~vagrant/.vagga/settings.yaml << EOF
storage-dir: "/home/vagrant/"
EOF

chown -R vagrant:vagrant ~vagrant/.vagga

echo "Vagga installed successfully"

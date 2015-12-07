cd /vagrant

HOST_DIR=/vagrant/.vagga
GUEST_DIR=~vagrant/project/.vagga

test -d $HOST_DIR || mkdir $HOST_DIR
test -d $GUEST_DIR || mkdir -p $GUEST_DIR
mountpoint -q /vagrant/.vagga || sudo mount --bind $GUEST_DIR $HOST_DIR

vagga $@

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'
Vagrant.configure(2) do |config|
  #config.vm.box = "hashicorp/precise64"
  config.vm.box = "ubuntu/trusty64"

  config.vagga.install = true
  config.vagga.testing = false

  config.vm.provision :vagga
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
end

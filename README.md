# Vagrant::Vagga

Vagrant plugin that simplifies installation and usage of [Vagga](http://vagga.readthedocs.org/).
It provides:
 - Automatic Vagga installation into the vagrant box (only ubuntu/trusty64 was tested, open an issue if you have troubles with other boxes)
 - `vagga` command for vagrant. Instead of SSH'ing into the machine you can use vagga like `vagrant vagga <vagga arguments>`

## Installation

Install gem to vagrant:

    $ vagrant plugin install vagrant-vagga

## Make your Vagga project support Windows or MacOS

 1. Install Vagrant
 2. Add Vagrantfile with content like in Usage paragraph below
 3. Install vagrant-vagga plugin
 4. You're awesome!


## Usage

Vagrantfile should contain provision line to install vagga on `vagrant up`.
Also you can add protection for users without this plugin to remind them install it.

```ruby
unless Vagrant.has_plugin?("vagrant-vagga")
  abort 'vagrant-vagga plugin is not installed! Do first # vagrant plugin install vagrant-vagga'
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :vagga
end
```

Your working directory with Vagrantfile should also contain vagga.yaml, which is implied by plugin logic.

```shell
$ vagrant up
... # after it's done
$ vagrant vagga
Available commands:
    run                 Run app
    setup               Setup application
    test                Run unit tests

$ vagrant vagga test
<...> # building images
```

## Development

http://docs.vagrantup.com/v2/plugins/development-basics.html

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rrader/vagrant-vagga.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


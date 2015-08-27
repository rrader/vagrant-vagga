# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-vagga/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-vagga"
  spec.version       = VagrantPlugins::Vagga::VERSION
  spec.authors       = ["Roman Rader"]
  spec.email         = ["roman.rader@gmail.com"]

  spec.summary       = "Vagrant plugin to install vagga in the box"
  spec.homepage      = "https://github.com/rrader/vagrant-vagga"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end

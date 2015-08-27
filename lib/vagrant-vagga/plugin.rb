module VagrantPlugins
  module Vagga
    class Vagga < Vagrant.plugin("2")
      name "vagga"

      description <<-DESC
      Vagga Provisioner
      DESC

      config :vagga do
        require_relative "config"
        Config
      end

      provisioner :vagga do
        require_relative 'provisioner'
        Provisioner
      end


      command :vagga do
        require_relative 'command'
        Command
      end

    end
  end
end

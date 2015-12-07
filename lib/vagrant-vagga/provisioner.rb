require 'fileutils'

module VagrantPlugins
  module Vagga
    class Provisioner < Vagrant.plugin('2', :provisioner)

      def initialize(machine, config)
        super(machine, config)
      end

      def provision
        setup_vagga
        setup_exec_script
      end

      def setup_vagga
        if @machine.config.vm.communicator != :winrm
          # workaround for mkdir("/vagrant/.vagga/.mnt", 0777) = -1 EACCES
          FileUtils.mkdir_p File.join(@machine.env.root_path, ".vagga", ".mnt")

          # run setup script
          setup_script_destination = "/tmp/setup_vagga.sh"
          setup_script_path = Pathname.new("../setup_vagga.sh").expand_path(__FILE__)
          @machine.communicate.upload(setup_script_path.to_s, setup_script_destination)
          @machine.communicate.sudo("chmod +x %s" % setup_script_destination)

          setup_call = @machine.communicate.sudo("%s" % [setup_script_destination]) do |type, data|
            @machine.env.ui.info(data.rstrip)
          end
        end
      end

      def setup_exec_script
        setup_script_destination = "/tmp/exec_vagga.sh"
        setup_script_path = Pathname.new("../exec_vagga.sh").expand_path(__FILE__)
        @machine.communicate.upload(setup_script_path.to_s, setup_script_destination)
        @machine.communicate.sudo("chmod +x %s" % setup_script_destination)
      end

    end
  end
end

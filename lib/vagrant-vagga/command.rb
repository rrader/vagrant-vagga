module VagrantPlugins
  module Vagga
    class Command < Vagrant.plugin('2', :command)

      def self.synopsis
        'executes vagga commands in virtual machine'
      end



      def execute
        args = @argv.join(' ')
        vagga_command = "/tmp/exec_vagga.sh #{args}"

        with_target_vms(nil, single_target: true) do |vm|
          vm.action(:up)

          @logger.info("Executing vagga command on remote machine: #{vagga_command}")
          ssh_opts = {extra_args: ['-q']} # make it quiet
          env = vm.action(:ssh_run, ssh_run_command: vagga_command, ssh_opts: ssh_opts)

          status = env[:ssh_run_exit_status] || 0
          return status
        end
      end

    end
  end
end

module Vagrant
  module Vagga
    class Command < Vagrant.plugin('2', :command)

      def self.synopsis
        'executes vagga commands in virtual machine'
      end



      def execute
        # puts @argv
        # cmd, cmd_args = parse_args
        # cmd && cmd_args or return nil
        args = @argv.join(' ')
        command = "cd /vagrant; vagga #{args}"

        # # Execute the actual SSH
        with_target_vms(nil, single_target: true) do |vm|
          @logger.info("Executing vagga command on remote machine: #{command}")
          ssh_opts = {extra_args: ['-q']} # make it quiet
          env = vm.action(:ssh_run, ssh_run_command: command, ssh_opts: ssh_opts)

          status = env[:ssh_run_exit_status] || 0
          return status
        end
      end



    end
  end
end

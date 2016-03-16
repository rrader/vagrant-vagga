require "vagrant"


module VagrantPlugins
  module Vagga
    class Config < Vagrant.plugin(2, :config)
      attr_accessor :install
      attr_accessor :testing

      def initialize
        @install = UNSET_VALUE
        @testing = UNSET_VALUE
      end

      def finalize!
        @install = false if @install == UNSET_VALUE
        @testing = false if @testing == UNSET_VALUE
      end
    end
  end
end

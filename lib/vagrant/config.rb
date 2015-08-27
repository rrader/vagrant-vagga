require "vagrant"


module Vagrant
  module Vagga
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :install

      def initialize
        @install = UNSET_VALUE
      end

      def finalize!
        @install = false if @install == UNSET_VALUE
      end
    end
  end
end

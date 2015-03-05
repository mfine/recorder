module Mediators::Devices
  class Creator < Mediators::Base
    def initialize(args)
    end

    def call
      Device.create
    end
  end
end

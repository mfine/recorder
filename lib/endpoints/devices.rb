module Endpoints
  class Devices < Base
    namespace "/devices" do
      before do
        content_type :json, charset: 'utf-8'
      end

      post do
        status 201
        encode Device.create
      end
    end
  end
end

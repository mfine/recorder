Sequel.extension :pg_hstore

module Endpoints
  class Records < Base
    namespace "/devices/:device_id/records" do
      before do
        content_type :json, charset: 'utf-8'
      end

      get do |device_id|
        encode Record.filter(device_id: device_id)
      end

      post do |device_id|
        status 201
        encode Record.create(device_id: device_id, data: Sequel.hstore(body_params))
      end
    end
  end
end

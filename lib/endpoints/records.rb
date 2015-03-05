Sequel.extension :pg_hstore

module Endpoints
  class Records < Base
    namespace "/devices/:device_id/records" do
      helpers do
        def chunk(s)
          "#{s.size.to_s(16)}\r\n#{s}\r\n"
        end
      end

      before do
        content_type :json, charset: 'utf-8'
      end

      get do |device_id|
        if params[:fetch] == "true"
          status 202
          headers "Transfer-Encoding" => "chunked"
          stream do |out|
            since = -1
            Record.filter(device_id: device_id).order(:txid).each do |entry|
              since = entry.txid
              out << chunk(encode(entry) + "\r\n")
            end
            while true
              Record.select(Sequel.lit("txid_snapshot_xmin(txid_current_snapshot()), *"))
                .filter{txid > since}.each do |entry|
                since = entry.txid
                out << chunk(encode(entry) + "\r\n")
              end
              out << chunk("\r\n")
              sleep 1
            end
          end
        else
          encode Record.filter(device_id: device_id)
        end
      end

      post do |device_id|
        status 201
        encode Record.create(device_id: device_id, data: Sequel.hstore(body_params))
      end
    end
  end
end

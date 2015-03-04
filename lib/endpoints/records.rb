module Endpoints
  class Records < Base
    namespace "/records" do
      before do
        content_type :json, charset: 'utf-8'
      end

      get do
        encode []
      end

      post do
        status 201
        encode Hash.new
      end

      get "/:id" do
        encode Hash.new
      end

      patch "/:id" do
        encode Hash.new
      end

      delete "/:id" do
        encode Hash.new
      end
    end
  end
end

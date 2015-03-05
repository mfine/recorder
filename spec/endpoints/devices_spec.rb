require "spec_helper"

describe Endpoints::Devices do
  include Rack::Test::Methods

  describe "GET /devices" do
    it "succeeds" do
      get "/devices"
      assert_equal 200, last_response.status
    end
  end
end

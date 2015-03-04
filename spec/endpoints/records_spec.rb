require "spec_helper"

describe Endpoints::Records do
  include Rack::Test::Methods

  describe "GET /records" do
    it "succeeds" do
      get "/records"
      assert_equal 200, last_response.status
    end
  end
end

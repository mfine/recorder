require "spec_helper"

describe Endpoints::Devices do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./docs/schema.json"
  end

  describe 'GET /devices' do
    it 'returns correct status code and conforms to schema' do
      get '/devices'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /devices' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/devices', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /devices/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/devices/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /devices/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/devices/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /devices/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/devices/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end

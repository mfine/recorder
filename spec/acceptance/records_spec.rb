require "spec_helper"

describe Endpoints::Records do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./docs/schema.json"
  end

  describe 'GET /records' do
    it 'returns correct status code and conforms to schema' do
      get '/records'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /records' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/records', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /records/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/records/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /records/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/records/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /records/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/records/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end

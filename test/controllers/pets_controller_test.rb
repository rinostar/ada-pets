require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  # Necessary setup to allow ensure we support the API JSON type
  # before do
  #   @request.headers['Accept'] = Mime::JSON
  #   @request.headers['Content-Type'] = Mime::JSON.to_s
  # end

  describe "index" do
    # These tests are a little verbose - yours do not need to be
    # this explicit.
    it "can get index" do
      get pets_url
      assert_response :success
    end

    it "returns json" do
      get pets_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get pets_url

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the pets" do
      get pets_url

      body = JSON.parse(response.body)
      body.length.must_equal Pet.count
    end

    it "returns pets with exactly the required fields" do
      keys = %w(age human id name)
      get pets_url
      body = JSON.parse(response.body)
      body.each do |pet|
        pet.keys.sort.must_equal keys
      end
    end
  end
end

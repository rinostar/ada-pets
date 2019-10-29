require 'test_helper'

describe PetsController do

  describe "index" do
    it "responds with JSON and success" do
      get pets_path

      expect(response.header['Content-Type']).must_include 'json'
      must_respond_with :ok
    end

    PET_FIELDS = ["age", "human", "name"]
    it "responds with an array of pet hashes" do

      get pets_path

      body = JSON.parse(response.body)

      expect(body).must_be_instance_of Array
      body.each do |pet|
        expect(pet).must_be_instance_of Hash
        expect(pet.keys.sort).must_equal PET_FIELDS
      end
    end
  end
end

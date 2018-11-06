require 'test_helper'

describe PetsController do
  PET_FIELDS = %w(id age name human).sort

  describe "index" do
    it "is a real working route" do
      get pets_path

      must_respond_with :success
      # binding.pry
      expect(response.header['Content-Type']).must_include 'json'

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Array
      expect(body.length).must_equal Pet.count

      body.each do |pet|
        expect(pet.keys.sort).must_equal PET_FIELDS
      end
    end

    it "returns an empty array when there are no pets" do
    end
  end
end

require 'test_helper'

describe PetsController do
  PET_FIELDS = %w(id age name human).sort

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  describe "index" do
    it "retrieves all the pets" do
      get pets_path

      body = check_response(expected_type: Array)

      expect(body.length).must_equal Pet.count

      body.each do |pet|
        expect(pet.keys.sort).must_equal PET_FIELDS
      end
    end

    it "returns an empty array when there are no pets" do
      # Arrange
      Pet.destroy_all

      # Act
      get pets_path

      # Assert
      body = check_response(expected_type: Array)
      expect(body).must_equal []
    end
  end

  describe "show" do
    it "retrieves info on one pet" do
      # Arrange
      pet = Pet.first

      # Act
      get pet_path(pet)

      # Assert
      body = check_response(expected_type: Hash)
      expect(body.keys.sort).must_equal PET_FIELDS
    end

    it "sends back not_found when the pet DNE" do
      # Arrange
      pet = Pet.first
      pet.destroy

      # Act
      get pet_path(pet)

      # Assert
      body = check_response(expected_type: Hash, expected_status: :not_found)
      expect(body).must_include "errors"
    end
  end
end

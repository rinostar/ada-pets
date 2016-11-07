require 'test_helper'

class PetTest < ActiveSupport::TestCase
  def compare_pets(fixture, result)
    assert_equal fixture, result
  end

  test "When there's one hit, it should be returned" do
    results = Pet.search(pets(:one).name)
    assert_instance_of Array, results

    assert_equal 1, results.length
    assert_instance_of Pet, results.first
    compare_pets(pets(:one), results.first)
  end

  test "When there's no hits, should get back an empty array" do
    results = Pet.search('xzxxcvvbn')
    assert_instance_of Array, results

    assert_empty results
  end

  test "Searching with multiple hits returns multiple results" do
    results = Pet.search('o')
    assert_instance_of Array, results

    assert_equal 2, results.length
    results.each do |pet|
      assert_instance_of Pet, pet
    end
  end
end

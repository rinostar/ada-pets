require 'test_helper'

class PetTest < ActiveSupport::TestCase
  let (:peanut) {users(:one)}
  it "can be created" do
    expect(peanut.valid?).must_equal true
  end

  it "requires name, age and human" do
    required_fields = [:name, :age, :human]

    required_fields.each do |field|
       peanut[field] = nil

       expect(peanut.valid?).must_equal false

       peanut.reload
    end
  end
end

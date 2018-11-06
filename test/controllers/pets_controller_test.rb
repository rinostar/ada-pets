require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  describe "index" do
    it "is a real working route" do
      get pets_path
      must_respond_with :success
    end
  end
end

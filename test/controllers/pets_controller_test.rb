require 'test_helper'

class PetsControllerTest < ActionController::TestCase

  # Necessary setup to allow ensure we support the API JSON type
  setup do
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  test "can get #index" do
    get :index
    assert_response :success
  end

  test "#index returns json" do
    get :index
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#index returns an Array of Pet objects" do
    get :index
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

  test "returns three pet objects" do
    get :index
    body = JSON.parse(response.body)
    assert_equal 3, body.length
  end

  test "each pet object contains the relevant keys" do
    keys = %w( age human id name )
    get :index
    body = JSON.parse(response.body)
    assert_equal keys, body.map(&:keys).flatten.uniq.sort
  end

  test "can #show a pet that exists" do
    # Send the request
    get :show, { id: pets(:one).id }
    assert_response :success

    # Check the response
    assert_match 'application/json', response.header['Content-Type']
    body = JSON.parse(response.body)
    assert_instance_of Hash, body

    # Check that the data sent matches what we requested
    keys = %w( age human id name )
    keys.each do |key|
      value_from_server = body[key]
      value_from_fixture = pets(:one)[key]
      assert_equal value_from_fixture, value_from_server
    end

    # Check that we didn't get any extra data
    assert_equal keys, body.keys.sort
  end

  test "#show for a id that doesn't exist returns no content" do
    # Send the request
    get :show, { id: 12345 }
    assert_response :not_found

    assert_empty response.body
  end
end

# # These are equivalent
# keys = %w( age human id name )
# keys.map(&:upcase)
# # and
# keys.map do |key|
#   key.upcase
# end

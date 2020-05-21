require 'test_helper'

class MessagesTest < ActionDispatch::IntegrationTest
  test "can get messages" do
    get "/messages"
    assert_response :success
  end
  test "can get messages content" do
    get "/messages"
    res = JSON.parse(@response.body)
    assert_equal '{"messages"=>["Hello"]}', res.to_s
  end

end

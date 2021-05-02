require "test_helper"

class SupportRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_request = support_requests(:one)
  end

  test "should get index" do
    get support_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_support_request_url
    assert_response :success
  end

  test "should create support_request" do
    assert_difference('SupportRequest.count') do
      post support_requests_url, params: { support_request: { details: @support_request.details, req_type: @support_request.req_type, user_id: @support_request.user_id } }
    end

    assert_redirected_to support_request_url(SupportRequest.last)
  end

  test "should show support_request" do
    get support_request_url(@support_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_support_request_url(@support_request)
    assert_response :success
  end

  test "should update support_request" do
    patch support_request_url(@support_request), params: { support_request: { details: @support_request.details, req_type: @support_request.req_type, user_id: @support_request.user_id } }
    assert_redirected_to support_request_url(@support_request)
  end

  test "should destroy support_request" do
    assert_difference('SupportRequest.count', -1) do
      delete support_request_url(@support_request)
    end

    assert_redirected_to support_requests_url
  end
end

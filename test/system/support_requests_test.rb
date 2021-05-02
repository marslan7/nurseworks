require "application_system_test_case"

class SupportRequestsTest < ApplicationSystemTestCase
  setup do
    @support_request = support_requests(:one)
  end

  test "visiting the index" do
    visit support_requests_url
    assert_selector "h1", text: "Support Requests"
  end

  test "creating a Support request" do
    visit support_requests_url
    click_on "New Support Request"

    fill_in "Details", with: @support_request.details
    fill_in "Req type", with: @support_request.req_type
    fill_in "User", with: @support_request.user_id
    click_on "Create Support request"

    assert_text "Support request was successfully created"
    click_on "Back"
  end

  test "updating a Support request" do
    visit support_requests_url
    click_on "Edit", match: :first

    fill_in "Details", with: @support_request.details
    fill_in "Req type", with: @support_request.req_type
    fill_in "User", with: @support_request.user_id
    click_on "Update Support request"

    assert_text "Support request was successfully updated"
    click_on "Back"
  end

  test "destroying a Support request" do
    visit support_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Support request was successfully destroyed"
  end
end

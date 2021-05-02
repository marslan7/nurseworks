require "application_system_test_case"

class UserDocsTest < ApplicationSystemTestCase
  setup do
    @user_doc = user_docs(:one)
  end

  test "visiting the index" do
    visit user_docs_url
    assert_selector "h1", text: "User Docs"
  end

  test "creating a User doc" do
    visit user_docs_url
    click_on "New User Doc"

    fill_in "Description", with: @user_doc.description
    fill_in "Doc type", with: @user_doc.doc_type
    fill_in "User", with: @user_doc.user_id
    click_on "Create User doc"

    assert_text "User doc was successfully created"
    click_on "Back"
  end

  test "updating a User doc" do
    visit user_docs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @user_doc.description
    fill_in "Doc type", with: @user_doc.doc_type
    fill_in "User", with: @user_doc.user_id
    click_on "Update User doc"

    assert_text "User doc was successfully updated"
    click_on "Back"
  end

  test "destroying a User doc" do
    visit user_docs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User doc was successfully destroyed"
  end
end

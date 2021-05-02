require "test_helper"

class UserDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_doc = user_docs(:one)
  end

  test "should get index" do
    get user_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_doc_url
    assert_response :success
  end

  test "should create user_doc" do
    assert_difference('UserDoc.count') do
      post user_docs_url, params: { user_doc: { description: @user_doc.description, doc_type: @user_doc.doc_type, user_id: @user_doc.user_id } }
    end

    assert_redirected_to user_doc_url(UserDoc.last)
  end

  test "should show user_doc" do
    get user_doc_url(@user_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_doc_url(@user_doc)
    assert_response :success
  end

  test "should update user_doc" do
    patch user_doc_url(@user_doc), params: { user_doc: { description: @user_doc.description, doc_type: @user_doc.doc_type, user_id: @user_doc.user_id } }
    assert_redirected_to user_doc_url(@user_doc)
  end

  test "should destroy user_doc" do
    assert_difference('UserDoc.count', -1) do
      delete user_doc_url(@user_doc)
    end

    assert_redirected_to user_docs_url
  end
end

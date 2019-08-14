require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jarod)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "food@invalid", password: "foo", password_combination: "bar" } }
    assert_template 'users/edit'
  end
end

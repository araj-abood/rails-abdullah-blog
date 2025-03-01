require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = User.create(username: "admin", password: "password", email: "johndoe@gmail.com", is_admin: true)
    sign_in_as @admin_user
  end

  test "get new category form and create category" do
    get new_category_path
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category" do
    get new_category_path
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    assert_match "errors", response.body
  end
end

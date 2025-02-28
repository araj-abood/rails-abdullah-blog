require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category_one = Category.create(name: "sports")
    @category_two = Category.create(name: "music")
  end

  test "should show categories listing" do
    get categories_path
    assert_select "a[href=?]", category_path(@category_one), text: @category_one.name
    assert_select "a[href=?]", category_path(@category_two), text: @category_two.name
  end
end

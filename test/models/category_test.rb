class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new name: "sports"
  end

  test "category is valid" do
    assert @category.valid?
  end

  test "name should be present" do

    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new name: "sports"

    assert_not @category2.valid?
  end

  test "name should not be to long" do
    @category.name = "a" * 51
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end
end
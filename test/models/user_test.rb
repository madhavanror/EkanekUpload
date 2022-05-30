require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Throw An Error Without Mandatory Fields" do
    user = User.new
    user.save
    assert_equal user.save, false
    assert_equal user.errors.full_messages, ["Password can't be blank", "First name can't be blank", "Last name can't be blank", "Email can't be blank", "Email is invalid"]
  end

  test "Create User Object" do
    user = User.new
    user.email = 'test@gmail.com'
    user.first_name = 'test1'
    user.last_name = 'test1'
    user.password = 'test1'
    user.password_confirmation = 'test1'
    assert_equal user.save, true
  end

  test "Validate Name Method" do
    user = User.create
    user.first_name = 'test2'
    user.last_name = 'test2'
    assert_equal user.name, 'Test2 Test2'
  end

  test "Create User With Same Email" do
    user = User.new
    user.email = 'Madhavan@gmail.com'
    user.first_name = 'test2'
    user.last_name = 'test2'
    user.password = 'test2'
    assert_equal user.save, false
    assert_equal user.errors.full_messages, ['Email has already been taken']
  end

  test "Create User With Invalid Email" do
    user = User.new
    user.first_name = 'test3'
    user.last_name = 'test3'
    user.password = 'test3'
    user.email = 'Madhavangmail.com'
    assert_equal user.save, false
    assert_equal user.errors.full_messages, ['Email is invalid']
  end
end

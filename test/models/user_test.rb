require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @user = User.new(first_name: "Example User", last_name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

# tests sur les first name
  test "first name should be nonblank" do
    @user.first_name = " " * 6
    assert_not @user.valid?
  end

  test "first name should be present" do
    @user.first_name = nil
    assert_not @user.valid?
  end

# tests sur les last name
  test "last name should be nonblank" do
    @user.last_name = " " * 6
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = nil
    assert_not @user.valid?
  end

# tests sur les email
  test "email should be nonblank" do
    @user.email = " " * 6
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @duplicate_user = @user.dup
    assert_not @duplicate_user.valid?
  end


end

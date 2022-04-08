require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user must have a username' do
    user = User.new(email: 'haha@haha.com', password: 'la' * 5)

    assert_not user.save

    user = User.new(username: 'a' * 9, email: 'haha@haha.com', password: 'la' * 5)

    assert user.save
  end

  test 'username must be at least 4 chars long and at most 16 chars' do
    user = User.new(username: 'a' * 3, email: 'haha@haha.com', password: 'la' * 5)

    assert_not user.save

    user = User.new(username: 'a' * 9, email: 'haha@haha.com', password: 'la' * 5)

    assert user.save

    user = User.new(username: 'a' * 17, email: 'haha@haha.com', password: 'la' * 5)

    assert_not user.save
  end

  test 'user should have an at least 8 chars long password' do
    user = User.new(username: 'a' * 9, email: 'haha@haha.com', password: 'a' * 7)

    assert_not user.save

    user = User.new(username: 'a' * 9, email: 'haha@haha.com', password: 'a' * 12)

    assert user.save
  end

end

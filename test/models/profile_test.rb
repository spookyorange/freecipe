require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  test 'profile must have a user' do
    profile = Profile.new(username: 'b' * 12)

    assert_not profile.save

    profile = Profile.new(user: users(:userone), username: 'b' * 12)

    assert profile.save
  end

  test 'profile must have a username and it should be between 6-18' do
    profile = Profile.new(user: users(:regular))

    assert_not profile.save

    profile = Profile.new(user: users(:regular), username: 'b' * 5)

    assert_not profile.save

    profile = Profile.new(user: users(:regular), username: 'b' * 19)

    assert_not profile.save

    profile = Profile.new(user: users(:userone), username: 'b' * 12)

    assert profile.save
  end

  test 'profile usernames must be unique' do
    profile_one = Profile.new(user: users(:userone), username: 'b' * 12)
    profile_two = Profile.new(user: users(:usertwo), username: 'b' * 12)

    profile_one.save
    assert_not profile_two.save
  end
end

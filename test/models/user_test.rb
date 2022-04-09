require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'emails should be unique' do
    userone = User.new(email: 'haha@haha', password: 'somesosecurepassword')
    usertwo = User.new(email: 'haha@haha', password: 'ididnotstealthisemail')

    userone.save
    assert_not usertwo.save
  end
end

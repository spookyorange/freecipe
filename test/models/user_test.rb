require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'emails should be unique' do
    userone = User.new(email: 'haha@haha', password: 'somesosecurepassword')
    usertwo = User.new(email: 'haha@haha', password: 'ididnotstealthisemail')

    userone.save
    assert_not usertwo.save
  end

  test 'passwords must be more than or equal to 8 chars max of 24' do
    newuser = User.new(email: 'dasdfghh@fdsg', password: 'a' * 6)
    assert_not newuser.save

    newuser = User.new(email: 'dasdsafdas@fdsferfdsg', password: 'a' * 8)
    assert newuser.save

    secondnewuser = User.new(email: 'dasfdghdas@fdsg', password: 'a' * 18)
    assert secondnewuser.save

    thirdnewuser = User.new(email: 'defwrdfg@fdjfdghjgbn', password: 'a' * 25)
    assert_not thirdnewuser.save

  end
end

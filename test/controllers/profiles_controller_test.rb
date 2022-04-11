require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end
  test 'if user not signed in they should be redirected to sign in before creation' do
    sign_out :user
    get new_profile_url
    assert_redirected_to new_user_session_url
  end
  test 'if user is logged in but has no profile, they should go to new profile' do
    sign_out :user
    sign_in users(:two)
    get recipes_url
    assert_redirected_to new_profile_url
  end

end

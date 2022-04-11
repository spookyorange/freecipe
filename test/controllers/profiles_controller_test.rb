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

  test 'if user is logged in and has a profile they can go edit their profile' do
    get edit_profile_url(1)
    assert_response :success
  end

  test "if user is logged in but is not the user of the profile they are trying to edit they get redirected
              to their profile" do
    sign_out :user
    sign_in users(:four)
    get edit_profile_url(1)
    assert_redirected_to profile_url(2)
  end

  test 'if user is not logged in they still can go and see other profiles' do
    sign_out :user
    get profile_url(2)
    assert_response :success
  end

end

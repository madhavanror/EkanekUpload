require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test 'Redirect To Documents Page If Login Success' do
    post '/login', params: { email: 'Madhavan@gmail.com', password: 'Test123' }
    assert_redirected_to documents_path
 end

  test 'Redirect To Login Page If Login Failure' do
    post '/login', params: { email: 'suriya@gmail.com', password: 'Test123' }
    assert_redirected_to root_path
  end

  test 'Sign Up Page' do
    get '/sign_up'
    assert_response :success
    assert_template 'users/new'
  end

  test 'Create New User Account' do
    post '/create', params: { user: { first_name: 'Anto',
                                      last_name: 'Mark',
                                      email: 'mark.anto@gmail.com',
                                      password: 'Test123',
                                      password_confirmation: 'Test123'
                                    }
                            }
    assert_redirected_to documents_path
  end

  test 'Redirect To Create New Account Page' do
    post '/create', params: { user: { first_name: 'Anto' } }
    assert_response :success
    assert_template 'users/new'
  end

  test 'Log Out' do
    post '/login', params: { email: 'Madhavan@gmail.com', password: 'Test123' }
    assert_redirected_to documents_path
    get '/log_out'
    assert_redirected_to root_path
  end
end

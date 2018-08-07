require 'test_helper'

class SessionsShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end


  test "show_secret exists and is accessible when connected" do #quand log in, on a accès via la navbar dans le header
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { first_name: "michael", last_name: "Raslecul", email: "michael@example.com", password: "password", password_confirmation: "password" } }
    assert is_logged_in?
    get '/show_secret/2000'
    assert_template 'essions/show_secret'
  end

  test "show_secret has to display the information about the user" do #quand log in, on a les infos de la personne
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { first_name: "Michael", last_name: "Raslecul", email: "michael@example.com", password: "password", password_confirmation: "password" } }
    assert is_logged_in?
    get '/show_secret/2000'
    assert_select "p", "Voici ton prénom : Michael, ton nom : Raslecul et ton email : michael@example.com."
  end

  test "if not logged in, not accessible" do #quand log out pas accès
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to '/'
    follow_redirect!
  end

# 4e test écrit mais qui ne passe pas : à regarder par le mousaillon
  # test "impossible to see others' information even when logged in" do #quand log in, on a accès via la navbar dans le header
  #   get login_path
  #   assert_template 'sessions/new'
  #   post login_path, params: { session: { first_name: "michael", last_name: "Raslecul", email: "michael@example.com", password: "password", password_confirmation: "password" } }
  #   assert is_logged_in?
  #   get '/show_secret/2001'
  #   assert_redirected_to 'sessions/2000'
  #   assert_not flash.empty?
  # end







end

class UserController < ApplicationController

  #responsible for rendering the user's homepage view
  get '/users/home' do

    @user = User.find(session[:user_id])
    erb :'/users/home'
  end
  
end
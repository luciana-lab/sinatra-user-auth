class SessionController < ApplicationController

 #responsible for rendering the login form
  get '/sessions/login' do

    # the line of code below render the view page in app/views/sessions/login.erb
    erb :'sessions/login'
  end

  #responsible for receive the POST request that gets sent when a user hits 'submit' on the login form
  #Contains code that grabs the user's info from the params hash, looks to match that info against the existing entries in the user database
  #if a matching entry is found, signs the user in
  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

  #responsible for logging the user out by clearing the session hash
  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

end
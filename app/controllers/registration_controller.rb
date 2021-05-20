class RegistrationController < ApplicationController
    
    #resposible for render the sign-up form view
    get '/registrations/signup' do
        erb :'/registrations/signup'
    end

  #responsible for handle the POST request that is sent when a user hits 'submit' on the sign-up form
  #It'll contain code that gets the new user's info from the params hash, creates a new user, signs them in, and then redirects then somewhere else
  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    
    redirect '/users/home'
  end

end
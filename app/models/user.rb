class User < ActiveRecord::Base
  #validate some of the attribute of our user
  #makes sure no one can sign up without inputting their name, email, and pw
  validates_presence_of :name, :email, :password
end
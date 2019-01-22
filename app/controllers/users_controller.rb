class UsersController < ApplicationController

  get '/signup' do

    erb :'users/signup'
  end

  post '/signup' do
    if !(params.has_value?(""))
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect 'users/myaccount'
    else
      redirect 'users/signup'
    end
  end

  get '/login' do

    erb :'users/login'
  end
end

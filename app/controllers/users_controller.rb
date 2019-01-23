class UsersController < ApplicationController

  get '/signup' do
    if Helpers.logged_in?(session)
      redirect 'users/myaccount'
    end
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
    if Helpers.logged_in?(session)
      redirect 'users/myaccount'
    end
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[user_id] = user.id
      redirect 'users/myaccount'
    end
    redirect '/login'
  end
end

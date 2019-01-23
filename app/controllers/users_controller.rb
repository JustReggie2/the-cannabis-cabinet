class UsersController < ApplicationController

  get '/signup' do
    if Helpers.logged_in?(session)
      redirect '/myaccount'
    end
    erb :signup
  end

  post '/signup' do
    if !(params.has_value?(""))
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/myaccount'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.logged_in?(session)
      redirect '/myaccount'
    end
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect 'users/myaccount'
    end
    redirect '/login'
  end

  get '/myaccount' do
    @user = User.find(session[:user_id])
    if @user
      erb :myaccount
    end
  end

  get '/logout' do
    if Helpers.logged_in?(session)
      session.clear
    end
    redirect '/login'
  end
end

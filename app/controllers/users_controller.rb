class UsersController < ApplicationController
use Rack::Flash
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @users = User.all
    if @users.all?{|u| u.email != params[:email]}
      if !(params.has_value?(""))
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        flash[:message] = "Success! New account created."
        redirect '/myaccount'
      else
        flash[:message] = "All fields must be filled out."
        redirect '/signup'
      end
    else
      flash[:message] = "You have already signed up, please login in."
      redirect '/login'
    end
  end

  get '/login' do
    if Helpers.logged_in?(session)
      redirect '/myaccount'
    end
    erb :'users/login'
  end

  post '/login' do
    if User.find_by(username: params[:username]) 
      user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/myaccount'
        end
        flash[:message] = "Incorrect password."
        redirect '/login'
    else
      flash[:message] = "You must have account to login. Please sign up."
      redirect '/signup'
    end
  end

  get '/myaccount' do
    @user = User.find_by_id(session[:user_id])

    erb :'users/show'
  end

  get '/logout' do
    if Helpers.logged_in?(session)
      session.clear
    end
    redirect '/login'
  end
end

class UsersController < ApplicationController
use Rack::Flash
  get '/signup' do
      erb :'users/signup'
    # if Helpers.logged_in?(session)
    #   redirect '/myaccount'
    # else
    #   erb :'users/signup'
    # end
  end

  post '/signup' do
    if !(params.has_value?(""))
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
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
    erb :'users/login' # had to specify users because coming from index page and login page
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/myaccount'
    end
    redirect '/'
  end

  get '/myaccount' do
    @user = User.find_by_id(session[:user_id])
    erb :'users/show'
    # if @user
    #   erb :'users/show'
    # end
  end

  get '/logout' do
    if Helpers.logged_in?(session)
      session.clear
    end
    redirect '/login'
  end
end

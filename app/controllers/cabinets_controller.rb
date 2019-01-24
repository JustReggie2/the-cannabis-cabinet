class CabinetsController < ApplicationController

  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end

  post '/mycabinets' do
    @user = Helpers.current_user(session)
    if @user
      cabinet = Cabinet.create(name: params[:cabinet_name])
      cabinet.user = User.find_by_id(session[:user_id])
      cabinet.strain_ids = params[:strains]
      cabinet.save

      redirect "mycabinets/#{cabinet.slug}"
    else
      redirect 'users/login'
    end
  end
end

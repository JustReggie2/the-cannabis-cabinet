class CabinetsController < ApplicationController

  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end

  get '/mycabinets/:id/edit' do
    redirect 'users/login' unless Helpers.logged_in?(session)

    @cabinet = Cabinet.find_by_id(params[:id])

    if @cabinet.user == Helpers.current_user(session)
      erb :'cabinets/edit'
    end
  end

  get '/mycabinets/:id' do
    if Helpers.logged_in?(session)
      @cabinet = Cabinet.find_by(params[:id])
    else
      redirect 'users/login'
    end
    erb :'cabinets/show'
  end

  post '/mycabinets' do
    @user = Helpers.current_user(session)
    if !@user
      redirect 'users/login'
    elsif !params[:cabinet_name].empty?
      cabinet = Cabinet.create(name: params[:cabinet_name])
      cabinet.user = @user
      cabinet.strain_ids = params[:strains]
      cabinet.save

      redirect "mycabinets/#{cabinet.id}"
    else
      redirect 'users/login'
    end
  end
end

class CabinetsController < ApplicationController

  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end

  get '/mycabinets/:slug' do
    if Helpers.logged_in?(session)
      @cabinet = Cabinet.find_by_slug(params[:slug])
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

      redirect "mycabinets/#{cabinet.slug}"
    else
      redirect 'users/login'
    end
  end
end

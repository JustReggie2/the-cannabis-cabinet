class CabinetsController < ApplicationController

  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end

  get '/mycabinets/:slug/edit' do
    redirect 'users/login' unless Helpers.logged_in?(session)

    @cabinet = Cabinet.find_by_slug(params[:slug])

    if @cabinet.user == Helpers.current_user(session)
      erb :'cabinets/edit'
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

  patch '/mycabinets/:slug' do
    cabinet = Cabinet.find_by_slug(params[:slug])

    redirect "/mycabinets/#{cabinet.slug}/edit" unless !params[:cabinet_name].empty?
    # if empty add flash message
    cabinet.update(name: params[:cabinet_name])
    cabinet.strain_ids = params[:strains]
    cabinet.save

    redirect "/mycabinets/#{cabinet.slug}"
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

      redirect "/mycabinets/#{cabinet.slug}"
    else
      redirect 'users/login'
    end
  end

  delete '/mycabinets/:slug/delete' do
    if Helpers.logged_in?(session)
      @cabinet = Cabinet.find_by_slug(params[:slug])
      if @cabinet.user == Helpers.current_user(session)
        @cabinet.delete
        redirect to '/myaccount'
      else
        # flash message "You are not allowed to delete this cabinet"
        redirect to '/myaccount'
      end
    else
      redirect to 'users/login'
    end
  end
end

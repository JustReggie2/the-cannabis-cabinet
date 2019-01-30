require 'rack-flash'

class CabinetsController < ApplicationController
use Rack::Flash
  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end

  post '/mycabinets/add' do
    @user = Helpers.current_user(session)
    if !@user
      redirect 'users/login'
    else
      cabinet = Cabinet.find_by_id(params[:cabinet_id])
      strain = Strain.find_by_id(params[:strain])
      cabinet.strains << strain


      redirect "/mycabinets/#{cabinet.slug}"
      # puts params
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
      flash[:message] = "You must be logged in."
      redirect 'users/login'
    elsif !params[:cabinet_name].empty?
      if @user.cabinets.all?{|c| c.name != params[:cabinet_name]}
        cabinet = Cabinet.create(name: params[:cabinet_name])
        cabinet.user = @user
        cabinet.strain_ids = params[:strains]
        cabinet.save
      else
        flash[:message] = "There is already a cabinet by that name. Try again."
        redirect '/mycabinets/new'
      end
      flash[:message] = "Cabinet name is required."
      redirect "/mycabinets/#{cabinet.slug}"
    else
      flash[:message] = "You must be logged in."
      redirect 'users/login'
    end
  end

  delete '/mycabinets/:slug/delete' do
    if Helpers.logged_in?(session)
      @cabinet = Cabinet.find_by_slug(params[:slug])
      if @cabinet.user == Helpers.current_user(session)
        @cabinet.delete
        flash[:message] = "Cabinet has been deleted successfully."
        redirect to '/myaccount'
      else
        flash[:message] = "Something went wrong. Try again."
        redirect to '/myaccount'
      end
    else
      flash[:message] = "You must be logged in."
      redirect to 'users/login'
    end
  end
end

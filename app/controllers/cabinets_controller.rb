require 'rack-flash'

class CabinetsController < ApplicationController
use Rack::Flash
  get '/mycabinets/new' do
    unless Helpers.logged_in?(session)
      flash[:message] = "Must be logged in to view this page."
      redirect '/login'
    end
    erb :'/cabinets/new'
  end

  post '/mycabinets/add' do
    @user = Helpers.current_user(session)
    redirect '/login' unless @user
    cabinet = Cabinet.find_by_id(params[:cabinet_id])
    strain = Strain.find_by_id(params[:strain])
    if cabinet.strains.all?{|s| s.name != strain.name}
      cabinet.strains << strain

      flash[:message] = "#{strain.name} has been added to #{cabinet.name}"
      redirect "/mycabinets/#{cabinet.slug}"
    else
      flash[:message] = "#{cabinet.name} already contains #{strain.name}"
      redirect "/mycabinets/#{cabinet.slug}"
    end
  end

  get '/mycabinets/:slug/edit' do
    redirect 'users/login' unless Helpers.logged_in?(session) #use elsewhere to clean up code - remove if/else statements

    @cabinet = Cabinet.find_by_slug(params[:slug])

    if @cabinet.user == Helpers.current_user(session)
      erb :'cabinets/edit'
    else
      flash[:message] = "You don't have permission to edit this cabinet."
      redirect '/myaccount'
    end
  end

  get '/mycabinets/:slug' do
    unless Helpers.logged_in?(session)
      flash[:message] = "Must be logged in to view this page."
      redirect '/login'
    end
    @cabinet = Cabinet.find_by_slug(params[:slug])

    erb :'cabinets/show'
  end

  patch '/mycabinets/:slug' do
  cabinet = Cabinet.find_by_slug(params[:slug])
    if cabinet.user != Helpers.current_user(session)
      flash[:message] = "You don't have permission to edit this cabinet."
      redirect '/myaccount'
    elsif !params[:cabinet_name].empty?
        cabinet.update(name: params[:cabinet_name])
        cabinet.strain_ids = params[:strains]
        cabinet.save
        flash[:message] = "Cabinet updated successfully."
        redirect "/mycabinets/#{cabinet.slug}"
    else
      flash[:message] = "Cabinet name is required."
      redirect "/mycabinets/#{cabinet.slug}/edit"
    end
  end

  post '/mycabinets' do
    @user = Helpers.current_user(session)
    redirect '/login' unless @user
    unless !params[:cabinet_name].empty?
      flash[:message] = "Cabinet must have a name."
      redirect '/mycabinets/new'
    end
    if @user.cabinets.all?{|c| c.name != params[:cabinet_name]}
      cabinet = Cabinet.create(name: params[:cabinet_name])
      cabinet.user = @user
      cabinet.strain_ids = params[:strains]
      cabinet.save
    else
      flash[:message] = "There is already a cabinet by that name. Try again."
      redirect '/mycabinets/new'
    end
    flash[:message] = "Cabinet successfully created."
    redirect "/mycabinets/#{cabinet.slug}"
  end

  delete '/mycabinets/:slug/delete' do
    unless Helpers.logged_in?(session)
      flash[:message] = "Must be logged in."
      redirect '/login'
    end
    @cabinet = Cabinet.find_by_slug(params[:slug])
    if @cabinet.user == Helpers.current_user(session)
      @cabinet.delete
    else
      flash[:message] = "Something went wrong. Try again."
      redirect to '/myaccount'
    end    
    flash[:message] = "Cabinet has been deleted successfully."
    redirect to '/myaccount'
  end
end

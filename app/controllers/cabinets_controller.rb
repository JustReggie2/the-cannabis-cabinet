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
    if @user
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
    else
      redirect 'users/login'
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
    if !params[:cabinet_name].empty?
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
      flash[:message] = "Cabinet successfully created."
      redirect "/mycabinets/#{cabinet.slug}"
    else
      flash[:message] = "Cabinet must have a name."
      redirect 'users/login'
    end
  end

  delete '/mycabinets/:slug/delete' do
    if Helpers.logged_in?(session)
      @cabinet = Cabinet.find_by_slug(params[:slug])
      if @cabinet.user == Helpers.current_user(session)
        @cabinet.delete
      else
        flash[:message] = "Something went wrong. Try again."
        redirect to '/myaccount'
      end
    else
      flash[:message] = "You must be logged in."
      redirect to 'users/login'
    end
    flash[:message] = "Cabinet has been deleted successfully."
    redirect to '/myaccount'
  end
end

class StrainsController < ApplicationController

  get '/strains' do
    @strains = Strain.all

    erb :'strains/index'
  end

  post '/strains' do
    puts params
    if Helpers.current_user(session)
      if !params[:strain_name].empty? && !params[:positives].empty? && !params[:negatives].empty?
        strain = Strain.create(name: params[:strain_name])
        strain.category = params[:category]
        strain.positives = params[:positives]
        strain.negatives = params[:negatives]
        strain.save

        redirect "/strains/#{strain.slug}"
      else
        redirect 'strains/new'
      end
    else
      redirect 'users/login'
    end
  end

  get '/strains/new' do
    if Helpers.logged_in?(session)
      erb :'/strains/new'
    else
      redirect 'users/login'
    end
  end

  get '/strains/:slug/edit' do
    redirect 'users/login' unless Helpers.logged_in?(session)

    @strain = Strain.find_by_slug(params[:slug])

    erb :'strains/edit'
  end

  get '/strains/:slug' do
    @strain = Strain.find_by_slug(params[:slug])
    @user = Helpers.current_user(session)
    erb :'strains/show'
  end

  patch '/strains/:slug' do
    @strain = Strain.find_by_slug(params[:slug])

    if !params[:strain_name].empty? && !params[:positives].empty? && !params[:negatives].empty?
      @strain.update(name: params[:strain_name])
      @strain.category = params[:category]
      @strain.positives = params[:positives]
      @strain.negatives = params[:negatives]
      @strain.save

      redirect "/strains/#{@strain.slug}"
    else
      redirect "/strains/#{@strain.slug}/edit"
    end
  end
end

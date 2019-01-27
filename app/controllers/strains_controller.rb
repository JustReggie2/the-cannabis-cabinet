class StrainsController < ApplicationController

  get '/strains' do
    @strains = Strain.all

    erb :'strains/index'
  end

  get '/strains/new' do
    if Helpers.logged_in?(session)
      erb :'/strains/new'
    else
      redirect 'users/login'
    end
  end

  get '/strains/:slug' do
    @strain = Strain.find_by_slug(params[:slug])

    erb :'strains/show'
  end

end

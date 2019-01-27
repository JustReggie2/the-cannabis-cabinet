class StrainsController < ApplicationController

  get '/strains' do
    @strains = Strain.all

    erb :'strains/index'
  end

  get '/strains/:slug' do
    @strain = Strain.find_by_slug(params[:slug])

    erb :'strains/show'
  end

end

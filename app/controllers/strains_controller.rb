class StrainsController < ApplicationController

  get '/strains' do
    @strains = Strain.all

    erb :'strains/index'
  end

end

class CabinetsController < ApplicationController

  get '/mycabinets/new' do
    if Helpers.logged_in?(session)
      erb :'/cabinets/new'
    else
      redirect 'users/login'
    end
  end
end

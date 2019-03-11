class TripController < ApplicationController

  get '/trips' do
    username = session[:username]
    @traveler = Traveler.find_by(:username => username)
    binding.pry
    erb:"trips/show"
  end

  get '/trips/new' do

    if !logged_in?
      redirect to "/login"
    else
      "A new trip form"
    end
  end

  get '/trips/:id/edit' do

    if !logged_in?
      redirect to "/login"
    else
      if post = current_user.trips.find_by(params[:id])

        "Edit a post form #{current_user.id} is editing #{post.id}"
      else
        redirect '/trips'
      end
    end
  end

end

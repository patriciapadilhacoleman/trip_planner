class TripController < ApplicationController

  get '/trips' do
    username = session[:username]
    @traveler = Traveler.find_by(:username => username)
    erb:"trips/show"
  end

  post '/trips' do

    @trip = Trip.new(params[:trip])
    @trip.traveler_id = session["user_id"]
    @trip.save
    @traveler = Traveler.find_by_id(@trip.traveler_id)
    binding.pry
    erb:"trips/show"
  end
  get '/trips/new' do

    if !logged_in?
      redirect to "/login"
    else
      erb:'trips/new'
    end
  end

  get '/trips/:id/edit' do

     binding.pry
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

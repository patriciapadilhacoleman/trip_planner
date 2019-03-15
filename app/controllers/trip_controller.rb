class TripController < ApplicationController

  get '/trips' do
    binding.pry
    if logged_in?
      @traveler = Traveler.find_by_id(session[:user_id])
      binding.pry
      erb:"trips/show"
    else
      erb:index
    end

  end

  post '/trips' do
    binding.pry
    @trip = Trip.new(params[:trip])
    @trip.traveler_id = session["user_id"]
    @trip.save
    @traveler = Traveler.find_by_id(@trip.traveler_id)
    erb:"trips/show"
  end
  get '/trips/new' do

    binding.pry
    if !session[:user_id]
      redirect to "/login"
    else
      @traveler = Traveler.find(session[:user_id])
      erb:'trips/new'
    end
  end

  post '/trips/new' do

    binding.pry
    if !session[:user_id]
      redirect to "/login"
    else
      @traveler = Traveler.find(session[:user_id])
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

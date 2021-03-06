class TripController < ApplicationController

  get '/trips' do

    if @traveler = current_user
      @trips = current_user.trips
      erb:"trips/show"
    else
      erb:index
    end

  end

  post '/trips' do

    @trip = Trip.create(params[:trip])
    @trip.traveler_id = session["user_id"]
    @trip.save
    @traveler = Traveler.find_by_id(@trip.traveler_id)
    erb:"trips/show"
  end

  get '/trips/new' do

    if !session[:user_id]
      redirect to "/login"
    else
      @traveler = Traveler.find(session[:user_id])
      erb:'trips/new'
    end
  end

  post '/trips/new' do
    if !session[:user_id]
      redirect to "/login"
    else
      @traveler = Traveler.find(session[:user_id])
      if !@trip_name = params[:trip][:name]
        @trip_name = ""
      end
    
      erb:'trips/new'
    end
  end

  get '/trips/:id' do


     if @trip = current_user.trips.find_by_id(params[:id])

        @traveler = Traveler.find(session[:user_id])
        erb:"/trips/show"

      else
        redirect '/trips'
      end
  end
  get '/trips/:id/edit' do

     if @trip = current_user.trips.find_by_id(params[:id])

        @traveler = Traveler.find(session[:user_id])
        erb:"/trips/edit"

      else
        redirect '/trips'
      end
  end

  post '/trips/:id/edit' do

     if @trip = current_user.trips.find_by(params[:id])

        @traveler = Traveler.find(session[:user_id])
        erb:"/trips/edit"

      else

        redirect '/trips'
      end

  end

  patch '/trips/:id' do
    @traveler = Traveler.find(session[:user_id])
    @trip = @traveler.trips.find(params[:id])
    # if !params[:traveler].keys.include?("trip_ids")
    # params[:traveler]["trip_ids"] = []
    # end

    @trip.update(params["trip"])

    erb:"trips/show"
    # if !params["trip"]["name"].empty?
    #   @traveler.trips << Trip.create(name: params["trip"]["name"])
    # end

    # redirect "travelers/#{@traveler.id}"
  end

  delete '/trips/:id' do

    if trip = Trip.find_by_id(params[:id])
      trip.delete
    end
    @traveler = Traveler.find(session[:user_id])
    if params[:home_page] == "travelers"
      erb:"travelers/show"
    else
      erb:"trips/show"
    end

  end

end

class TravelersController < ApplicationController

  get '/signup' do
    erb:"travelers/new"
  end

  post '/travelers' do

    @traveler = add_traveler(params)

    if @traveler
     login(params[:username], params[:password])
     redirect to '/trips/new'
    else
      erb:"travelers/new.html"
    end
  end

  get '/travelers' do
    erb:index #signup or login

  end

  post '/travelers/new' do #signup
    erb :'/travelers/new'
  end


  get '/travelers/:id/edit' do

    if logged_in?
      @traveler = Traveler.find(params[:id])
      erb :'/travelers/edit'
    else
      logout
      erb:index #signup or login
    end

  end

  post '/travelers/:id/edit' do


    @traveler = Traveler.find(params[:id])

    erb :'/travelers/edit'
  end

  get '/travelers/:id' do
    if logged_in?
      @traveler = Traveler.find(params[:id])
      erb :'/travelers/show'
    else
      logout
      erb:index #signup or login
    end

  end

  patch '/travelers/:id' do
    @traveler = Traveler.find(params[:id])

    if !params[:traveler].keys.include?("trip_ids")
    params[:traveler]["trip_ids"] = []
    end

    @traveler.update(params["traveler"])
    if !params["trip"]["name"].empty?
      @traveler.trips << Trip.create(name: params["trip"]["name"])
    end
    redirect "travelers/#{@traveler.id}"
  end

  delete '/travelers/:id' do

    traveler = Traveler.find_by_id(params[:id])
    traveler.delete

    erb:index
  end

  def add_traveler(params)

    @traveler = Traveler.new
    @traveler.username = params[:username]
    @traveler.password = params[:password]
    @traveler.first_name = params[:first_name]
    @traveler.last_name = params[:last_name]
    @traveler.dob = params[:dob]
    @traveler.home_airport = params[:home_airport]
    @traveler.street_address = params[:street_address]
    @traveler.city = params[:city]
    @traveler.state = params[:state]
    @traveler.zip = params[:zip]
    @traveler.save
    @traveler

  end

end

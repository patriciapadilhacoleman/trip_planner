class TravelersController < ApplicationController

  get '/signup' do
    erb:"travelers/new.erb"
  end

  post '/travelers' do
    @traveler = Traveler.new
    @traveler.username = params[:username]
    @traveler.password = params[:password]
    binding.pry
    if @traveler.save
     login(params[:username], params[:password])
     redirect to '/trips'
    else
      erb:"travelers/new.html"
    end
  end

  get '/travelers' do
    binding.pry

    # erb :'/travelers/index'
  end

  get '/travelers/new' do
    trips = Trip.all
    erb :'/travelers/new'
  end


  get '/travelers/:id/edit' do
    @traveler = Traveler.find(params[:id])
    trips = Trip.all
    erb :'/travelers/edit'
  end

  get '/travelers/:id' do
    @traveler = Traveler.find(params[:id])
    erb :'/travelers/show'
  end

  patch '/travelers/:id' do
    @traveler = Traveler.find(params[:id])

    ####### the following bug fix is required so that it's possible to remove ALL previous pets from owner.
    if !params[:traveler].keys.include?("trip_ids")
    params[:traveler]["trip_ids"] = []
    end
    ####### End of fix

    @traveler.update(params["traveler"])
    if !params["trip"]["name"].empty?
      @traveler.trips << Trip.create(name: params["trip"]["name"])
    end
    redirect "travelers/#{@traveler.id}"
  end
end

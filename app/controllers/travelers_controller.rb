class TravelersController < ApplicationController

  get '/signup' do
    erb:"travelers/new"
  end

  post '/travelers' do
    @traveler = Traveler.new
    @traveler.username = params[:username]
    @traveler.password = params[:password]
    if @traveler.save
     login(params[:username], params[:password])
     redirect to '/trips/new'
    else
      erb:"travelers/new.html"
    end
  end

  get '/travelers' do
    erb:index #signup or login

  end

  get '/travelers/new' do #signup
    erb :'/travelers/new'
  end


  get '/travelers/:id/edit' do


    @traveler = Traveler.find(params[:id])

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

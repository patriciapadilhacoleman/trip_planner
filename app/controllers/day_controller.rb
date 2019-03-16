class DayController < ApplicationController

  post "/days/new" do

    @day = Day.create(params[:day])
    @day.trip_id = params[:trip][:id]
    @day.save
    @traveler = current_user
    @trip = current_user.trips.find_by_id(params[:id])
    erb:"/trips/show"
  end

  patch '/days/:id' do
    @traveler = current_user
    @day = Day.find_by_id(params[:id])
    @day.update(params["day"])
    erb:"trips/show"
  end

  delete '/days/:id' do
    if day = Day.find_by_id(params[:id])
      day.delete
    end
    @traveler = current_user
    erb:"trips/show"
  end

end

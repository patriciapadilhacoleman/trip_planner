class DayController < ApplicationController

  post "/days/new" do

    @day = Day.create(params[:day])
    @day.trip_id = params[:trip][:id]
    @day.save
    binding.pry
    @traveler = current_user
    @trip = current_user.trips.find_by_id(params[:id])
    erb:"/trips/show"
  end
end

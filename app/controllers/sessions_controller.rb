class SessionsController < ApplicationController

  get  '/login' do
    erb:"sessions/login.html"
  end

   post '/sessions' do

     id = login(params[:username], params[:password])
     binding.pry
     @traveler = Traveler.find(id)
     erb :'/travelers/show'
   end

   get '/logout' do
     logout
     erb:index
   end

end

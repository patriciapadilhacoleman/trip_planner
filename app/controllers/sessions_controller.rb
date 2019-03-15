class SessionsController < ApplicationController

  get  '/login' do
    erb:"sessions/login.html"
  end

   post '/sessions' do

     id = login(params[:username], params[:password])
     @traveler = Traveler.find(id)
     binding.pry
     erb :'/travelers/show'
   end

   get '/logout' do
     logout
     erb:index
   end

end

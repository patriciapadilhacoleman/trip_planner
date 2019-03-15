class SessionsController < ApplicationController

  get  '/login' do
    erb:"sessions/login.html"
  end

   post '/sessions' do

     id = login(params[:username], params[:password])
    
       if id != nil
         @traveler = Traveler.find(id)
         erb :'/travelers/show'
       else
         erb:index
       end
    end

   get '/logout' do
     logout
     erb:index
   end

end

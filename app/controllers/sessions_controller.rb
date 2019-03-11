class SessionsController < ApplicationController

  get  '/login' do
    erb:"sessions/login.html"
  end

   post '/sessions' do
     binding.pry
     login(params[:username], params[:password])
     redirect to '/trips'
   end

   get '/logout' do
     logout
     redirect to '/trips'
   end

end

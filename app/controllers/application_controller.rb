require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb:index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Traveler.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      user = Traveler.find_by(:username => username)
      if user && user.authenticate(password)
          session[:username] = user.username
          session[:user_id] = user.id
      else
        redirect to '/login'
      end
    end

    def logout
      session.clear
    end

  end
end

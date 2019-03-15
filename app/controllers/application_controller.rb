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
      if params["id"].to_i == session[:user_id]
        return true
      end

    end

    def current_user
      @current_user ||= Traveler.find_by_id(session[:user_id])
    end

    def login(username, password)
      binding.pry
      user = Traveler.find_by(:username => username)

      if user && user.authenticate(password)
          session[:username] = user.username
          session[:user_id] = user.id
      end
    end

    def logout
      session.clear
    end

  end
end

require './config/environment'

class ApplicationController < Sinatra::Base
  set :method_override, true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "learnHt_secret"
  end

  get "/" do
    if Helpers.is_logged_in? session
      redirect '/home'
    else
      erb :index
    end
  end

end

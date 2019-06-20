require './config/environment'
require 'sinatra/base'
require 'rack-flash'
require 'sinatra/redirect_with_flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
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

  post '/login' do
    student = Student.find_by(email: params[:email]) unless params[:email].empty?

    if !student
      flash[:error] = 'this email doesn\'t exist. <br> If you don\'t have an accout, create one!'
      redirect '/'
    end

    if student && student.authenticate(params[:password])
      session[:user_id] = student.id
      redirect '/home'
    else
      flash[:error] = 'invalid email or password. <br> If you don\'t have an accout, create one!'
      redirect '/'
      #redirect '/signup'
    end
  end

end

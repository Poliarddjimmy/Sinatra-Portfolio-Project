require 'sinatra/base'
require 'rack-flash'

class TeachersController < ApplicationController
  #use Rack::Flash

  get '/teacher/:slug' do
    @user = Student.find_by_slug(params[:slug])
    erb :'teacher/home'
  end

  get '/teacher/new' do
    erb :'teacher/new'
  end

  post '/teacher/new'do
    teacher = Teacher.new params

    if teacher.save
      #session[:user_id] = teacher.id
      redirect '/'
    else
      redirect '/teacher/new'
    end
  end

  get '/teacher/home' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'tacher/home'
    else
      redirect to '/'
    end
  end



end

require 'sinatra/base'
require 'rack-flash'

class StudentsController < ApplicationController
  #use Rack::Flash

  get '/student/:slug' do
    @user = Student.find_by_slug(params[:slug])
    erb :'student/home'
  end

  get '/signup' do
    if Helpers.is_logged_in? session
      redirect '/home'
    else
      erb :'student/register'
    end
  end

  post '/signup'do
    student = Student.new params

    if student.save
      session[:user_id] = student.id
      redirect '/'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.is_logged_in? session
      redirect '/student/home'
    else
      redirect '/'
    end
  end

  get '/home' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'student/home'
    else
      redirect to '/'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in? session
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end



end

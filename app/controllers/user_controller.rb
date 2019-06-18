require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
  #use Rack::Flash

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/home'
  end

  get '/home' do
    if Helpers.is_logged_in? session
      redirect '/user/home'
    else
      erb :"/"
    end
  end

  get "/signup" do
    if Helpers.is_logged_in? session
      redirect '/home'
    else
      erb :"user/register"
    end
  end

  get '/login' do
    if Helpers.is_logged_in? session
      redirect '/user/home'
    else
      erb :"/"
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email]) unless params[:email].empty?

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else
      redirect "/signup"
    end
  end
end

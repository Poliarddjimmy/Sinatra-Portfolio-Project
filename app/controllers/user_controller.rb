require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/home'
  end

  get '/signup' do
    if Helpers.is_logged_in? session
      redirect '/home'
    else
      erb :'user/register'
    end
  end

  post '/signup'do
    user = User.find_by(email: params[:email]) unless params[:email].empty?
    if !user
      user = User.new params

      if user.save
        session[:user_id] = user.id
        redirect '/'
      else
        redirect '/signup'
      end
    else
      flash[:error] = 'this email exist already. <br> go to the login page to sign in'
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.is_logged_in? session
      redirect '/user/home'
    else
      redirect '/'
    end
  end

  get '/home' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'user/home'
    else
      redirect to '/'
    end
  end

  get '/students' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'user/student'
    else
      redirect to '/'
    end
  end

  get '/update/user/:id/:di' do
     user = User.find_by_id(params[:id])
     if user.update(is_admin: params[:di])
       redirect back
     else
       return "med"
     end
   end

   get '/profile/user=:pseudo' do
     if Helpers.is_logged_in? session
       @user1 = Helpers.current_user session
       @user = User.find_by_pseudo(params[:pseudo])
       erb :'user/profile'
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

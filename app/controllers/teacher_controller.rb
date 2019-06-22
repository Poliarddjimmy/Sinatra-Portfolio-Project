require 'sinatra/base'
require 'rack-flash'

class TeachersController < ApplicationController
  use Rack::Flash

  post '/teacher/new' do
    if Helpers.is_logged_in? session
      user = User.find_by(email: params[:email]) unless params[:email].empty?
      if !user
        user = User.new params
        if user.save
          flash[:teacher] = 'The teacher has been created'
          redirect back
        else
          flash[:teacher] = 'Have an error in your process'
          redirect back
        end
      else
        flash[:teacher] = 'this email exist already. Please choose another one'
        redirect back
      end
    else
      redirect to '/'
    end
  end

end

require 'sinatra/base'
require 'rack-flash'

class CoursController < ApplicationController
  get "/cours" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'/cours/cours'
    else
      redirect to '/'
    end
  end
end

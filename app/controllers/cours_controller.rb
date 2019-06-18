require 'sinatra/base'
require 'rack-flash'

class CoursController < ApplicationController
  get "/cours" do
    if Helpers.is_logged_in? session
      erb :'/cours/cours'
    else
      redirect to '/'
    end
  end
end

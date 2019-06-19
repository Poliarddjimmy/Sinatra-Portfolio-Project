class CourseController < ApplicationController
  get "/cours" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'/cours/cours'
    else
      redirect to '/'
    end
  end


  get "/cours/new" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'/cours/new'
    else
      redirect to '/'
    end
  end


  post "/cours/new" do
    if Helpers.is_logged_in? session

      cour = Helpers.current_user(session).courses.create(:cours_name=> params[:cours_name], :cours_description => params[:cours_description])
      if cour.save
        redirect to "/cours/#{cour.id}"
      else
        redirect to "/cours/new"
      end
    else
      redirect to '/'
    end
  end


end

class CourseController < ApplicationController
  get "/course" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'/course/cours'
    else
      redirect to '/'
    end
  end


  get "/course/new" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      erb :'/course/new'
    else
      redirect to '/'
    end
  end


  post "/course/new" do
    if Helpers.is_logged_in? session

      cour = Helpers.current_user(session).courses.create(:course_name=> params[:cours_name], :course_description => params[:cours_description])
      if cour.save
        redirect to "/course/#{cour.id}"
      else
        redirect to "/course/new"
      end
    else
      redirect to '/'
    end
  end


  get '/course/:id' do
    if Helpers.is_logged_in? session
      @course = Course.find_by_id(params[:id])
      @user = Helpers.current_user session
      erb :'course/show'
    else
      redirect to '/login'
    end
  end


  post '/modul/new'do
    modul = User.find_by(modul_title: params[:modul_title]) unless params[:modul_title].empty?
    if !modul
      user = Modul.new params

      if modul.save
        flash[:success] = 'The modul has been add successfully'
        redirect back
      else
        redirect '/signup'
      end
    else
      flash[:error] = 'this modul title exist already.'
      redirect back
    end
  end


end

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
      @modul = Modul.all
      @user = Helpers.current_user session
      erb :'course/show'
    else
      redirect to '/login'
    end
  end


  post '/modul/new'do
    modul = Modul.find_by(modul_title: params[:modul_title]) unless params[:modul_title].empty?
    if !modul
      modul = Modul.new params

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


  get '/course/:id/:title/:di' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      #title = params[:title].gsub("-"," ")


      @modulo = Modul.find_by_course_id(params[:id])
      @modul = Modul.find_by_modul_number(params[:di])
      @moduse =ModulUser.find_by_modul_id_and_user_id(params[:di], @user.id)
      erb :'course/module/show'
    else
      redirect to '/login'
    end
  end

  post '/add/ModulUser' do
    @user = Helpers.current_user session
    @moduse = @user.modul_users.find_by_modul_id(params[:modul_id])
    if @moduse

    else
      @moduse = ModulUser.new params
      if @moduse.save

      end
    end
  end

  post '/add/CourseUser' do
    @user = Helpers.current_user session
    @coruse = @user.course_users.find_by_course_id(params[:course_id])
    if @coruse

    else
      @corus = CourseUser.new params
      if @corus.save
        flash[:success] = 'Your subscription has been a success'
        redirect back
      end
    end
  end

  get '/delete/:id' do
    @moduse = ModulUser.find_by_id(params[:id])
    if @moduse.delete
      redirect back
    end
  end

  get '/update/:id/:number' do
     modul = Modul.find_by_id(params[:id])
     if modul.update(modul_number: params[:number])
       redirect back
     else
       return "med"
     end
   end



end

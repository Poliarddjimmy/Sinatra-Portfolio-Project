class CourseController < ApplicationController
  get "/classes" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @class = ClassRoom.all
      erb :'/course/class_room'
    else
      redirect to '/'
    end
  end

  get "/my-class" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @pam = ClassUser.find_by_user_id(@user.id)
      erb :'/course/my_class'
    else
      redirect to '/'
    end
  end

  get "/:title/:id/show" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @class = ClassRoom.find(params[:id])
      if ClassUser.find_by_class_id(@class.id)
        erb :'/course/classe'
      else
        flash[:success] = 'You don\'t subscribe to this class yet. Please, click on subscribe to this class to get in'
        redirect back
      end
    else
      redirect to '/'
    end
  end

  get "/class/course" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @class = ClassUser.find_by_user_id(@user.id)
      erb :'/course/classe'
    else
      redirect to '/'
    end
  end

  get "/course/my-courses" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @course = @user.courses.all
      erb :'/course/my_course'
    else
      redirect to '/'
    end
  end

  patch '/edit/course/:id' do
    if Helpers.is_logged_in? session
      course = Course.find_by_id(params[:id])
      if course && course.user == Helpers.current_user(session)
        if course.update(course_name: params[:course_name], course_description: params[:course_description])
          flash[:success] = 'The course has been update successfully'
          redirect back
        else
          flash[:success] = 'The course hasn\'t been update'
          redirect back
        end
      else
        flash[:success] = 'This course is not belong to you'
        redirect back
      end
    else
      redirect to '/login'
    end
  end

  patch '/edit/class/:id' do
    if Helpers.is_logged_in? session
      classe = ClassRoom.find(params[:id])
      if classe
        if classe.update(cr_name: params[:cr_name], cr_description: params[:cr_description])
          flash[:success] = 'The class has been update successfully'
          redirect back
        else
          flash[:bad] = 'The class hasn\'t been update'
          redirect back
        end
      else
        flash[:bad] = 'Error process'
        redirect back
      end
    else
      redirect to '/login'
    end
  end

  patch '/edit/module/:id' do
    if Helpers.is_logged_in? session
      modul = Modul.find_by_id(params[:id])
      if modul
        if modul.update(modul_description: params[:modul_description], modul_content: params[:modul_content])
          flash[:success] = 'The modul has been update successfully'
          redirect back
        else
          flash[:success] = 'The modul hasn\'t been update'
          redirect back
        end
      else
        flash[:success] = 'Can\'t find the modul'
        redirect back
      end
    else
      redirect to '/login'
    end
  end


  get "/course/new" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @category = Category.all
      @class = ClassRoom.all
      erb :'/course/new'
    else
      redirect to '/'
    end
  end

  post "/category/new" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @category = Category.find_by_category_name(params[:category_name])
      if @category
        flash[:bon] = 'this category exist already.'
        redirect back
      else
        category = Category.new(params)
        if category.save
          flash[:bon] = 'The category has been created successfully.'
          redirect back
        else
          flash[:bon] = 'Error process.'
          redirect back
        end
      end
    else
      redirect to '/'
    end
  end


  post "/class/new" do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @class = ClassRoom.find_by_cr_name(params[:cr_name])
      if @class
        flash[:bon] = 'this class exist already.'
        redirect back
      else
        classe = ClassRoom.new(params)
        if classe.save
          flash[:bon] = 'The class has been created successfully.'
          redirect back
        else
          flash[:bon] = 'Error process.'
          redirect back
        end
      end
    else
      redirect to '/'
    end
  end


  post "/course/new" do
    if Helpers.is_logged_in? session

      cour = Helpers.current_user(session).courses.create(params)
      #:class_id params[:class_id], :,:course_name=> params[:course_name], :course_description => params[:course_description]
      if cour.save
        redirect to "/course/#{cour.id}"
      else
        redirect to "/course/new"
      end
    else
      redirect to '/'
    end
  end


  get '/show/course/:id' do
    if Helpers.is_logged_in? session
      @course = Course.find_by_id(params[:id])
      if @course
        @modul = Modul.all
        @user = Helpers.current_user session
        erb :'course/show'
      else
        redirect to '/course'
      end
    else
      redirect to '/login'
    end
  end


  post '/modul/new'do
    modul = Modul.find_by(modul_title: params[:modul_title]) unless params[:modul_title].empty?
    if !modul
      m = Modul.all.where(course_id: params[:course_id])
      params[:modul_number] = m.size.to_i + 1
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


  get '/show/course/:id/:title/:di' do
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
      redirect back
    else
      @moduse = ModulUser.new params
      if @moduse.save
        flash[:success] = 'Your subscription has been a success'
        redirect back
      end
    end
  end

  post '/add/CourseUser' do
    @user = Helpers.current_user session
    @coruse = @user.course_users.find_by_course_id(params[:course_id])
    if @coruse
      redirect back
    else
      @corus = CourseUser.new params
      if @corus.save
        flash[:success] = 'This course is active now'
        redirect back
      end
    end
  end

  post '/add/calssuser' do
    @user = Helpers.current_user session
    @clause = @user.class_users.find_by_class_id(params[:class_id])
    if @clause
      flash[:success] = 'Your are a student'
      redirect back
    else
      @clausee = ClassUser.new params
      if @clausee.save
        flash[:success] = 'Your subscription has been a success'
        redirect back
      end
    end
  end

  post '/delete/:what' do
    if Helpers.is_logged_in? session
      if params[:what] == 'course'
        @course = CourseUser.all
        if @course.delete_all
          #flash[:teacher] = 'All course\'s class has been clear'
          #redirect back
          return 'All course\'s class has been clear'
        end
      elsif params[:what] == 'module'
        @modul = ModulUser.all
        if @modul.delete_all
          return 'All module\'s class has been clear'
        end
      elsif params[:what] == 'class'
        @class = ClassUser.all
        if @class.delete_all
          return 'All  class has been clear'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/:what/delete/:id' do
    bom = params[:what]
    if bom == 'modul'
      @modul = Modul.find_by_id(params[:id])
      if @modul.delete
        flash[:success] = 'The modul has been deleted successfully'
        redirect "/course/#{@modul.course_id}"
      else
        flash[:success] = 'The modul wasn\'t delete successfully'
        redirect "/course/#{@modul.course_id}"
      end
    else
      @course = Course.find_by_id(params[:id])
      if @course.delete
        flash[:success] = 'The course has been deleted successfully'
        redirect "/course"
      end
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

   get '/plot/:id' do
     @d = CourseUser.find_by_id(params[:id])
     if @d.delete
       flash[:success] = 'The course has been deleted successfully'
       redirect back
     end
   end



end

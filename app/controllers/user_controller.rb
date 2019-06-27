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

  get '/resume/:id' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      @resume = Resume.new(user_id: params[:id])
      if @resume.save
        redirect back
      end
    else
      redirect to '/'
    end
  end


  post '/signup'do
    user = User.find_by(email: params[:email]) unless params[:email].empty?
    if !user
      user = User.new params

      if user.save
        @resume = Resume.new
        @resume.user_id = user.id
        @resume.save
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

  post '/user/new' do
    if Helpers.is_logged_in? session
      user = User.find_by(email: params[:email]) unless params[:email].empty?
      if !user
        user = User.new params
        if user.save
          flash[:teacher] = 'The user has been created'
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

  get '/see/:what' do
    if Helpers.is_logged_in? session
      @what = params[:what]
      @user = Helpers.current_user session
      if params[:what] == 'students'
        @see = User.all.where(is_a_teacher: 0)
        erb :'user/see'
      else
        @see = User.all.where(is_a_teacher: 1)
        erb :'user/see'
      end
    else
      redirect to '/'
    end
  end


  post '/change/:what' do
     user = User.find_by_id(params[:id])
     if params[:what] == 'student'
       if user.update(is_a_teacher: 0)
         flash[:teacher] = 'The status of the user has been changed'
         redirect back
       else
         flash[:teacher] = 'The status of the user wasn\'t changed'
         redirect back
       end
     elsif params[:what] == 'teacher'
       if user.update(is_a_teacher: 1)
         flash[:teacher] = 'The status of the user has been changed'
         redirect back
       else
         flash[:teacher] = 'The status of the user wasn\'t changed'
         redirect back
       end
     end
   end

   patch '/edit/password/:di' do
     if Helpers.is_logged_in? session
        @user = Helpers.current_user session
        if @user.authenticate(params[:password])
          if @user.update(password: params[:pwd])
            flash[:success] = 'Your password has been change'
            redirect back
          end
        else
          flash[:success] = 'The old password is incorrect'
          redirect back
        end

      else
        redirect to '/'
      end
    end

   get '/profile/user=:pseudo' do
     if Helpers.is_logged_in? session
       @user1 = Helpers.current_user session
       @user = User.find_by_pseudo(params[:pseudo])
       @resume = Resume.find_by_user_id(@user.id)
       erb :'user/profile'
     else
       redirect to '/'
     end
   end

   post '/login' do
     user = User.find_by(email: params[:email]) unless params[:email].empty?
     if !user
       flash[:error] = 'This email doesn\'t exist. <br> If you don\'t have an accout, create one!'
       redirect '/'
     end
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect '/home'
     else
       flash[:error] = 'invalid email or password. <br> If you don\'t have an accout, create one!'
       redirect '/'
       #redirect '/signup'
     end
   end

   patch '/edit/user/work' do
     if Helpers.is_logged_in? session
       @user = Helpers.current_user session
       if @user.authenticate(params[:password])
         @resume = Resume.find(@user.id)
         @resume.update(company_experience: params[:company_experience], position: params[:position], task: params[:task], start_date:params[:start_date], end_date: params[:end_date])
         flash[:success] = 'Your profil has been update'
         redirect back
       else
         flash[:success] = 'the password is incorrect'
         redirect back
       end

     else
       redirect to '/'
     end
   end

   patch '/edit/user/ed' do
     if Helpers.is_logged_in? session
       @user = Helpers.current_user session
       if @user.authenticate(params[:password])
         @resume = Resume.find(@user.id)
         @resume.update(education_shool: params[:education_shool], education_option: params[:education_option], education_start_date: params[:education_start_date], education_end_date:params[:education_end_date])
         flash[:success] = 'Your profil has been update'
         redirect back
       else
         flash[:success] = 'the password is incorrect'
         redirect back
       end

     else
       redirect to '/'
     end
   end
#, phone: params[:phone]
  patch '/edit/perso' do
    if Helpers.is_logged_in? session
      @user = Helpers.current_user session
      if @user.authenticate(params[:password])
        @resume = Resume.find(@user.id)
        @resume.update(title: params[:title], skills: params[:skills])
        @user.update(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], phone: params[:phone])
        flash[:bb] = 'Your profil has been update'
        redirect back
      else
        flash[:bb] = 'the password is incorrect'
        redirect back
      end

    else
      redirect to '/'
    end
  end

   post '/:what/edit/last_name' do
     if Helpers.is_logged_in? session
       @user = Helpers.current_user session
       if @user.authenticate(params[:password])
         @user.update(last_name: params[:up])
         flash[:success] = 'Your profil has been update'
         redirect back
       else
         flash[:success] = 'the password is incorrect'
         redirect back
       end

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

  get '/delete/user/:id' do
    if Helpers.is_logged_in? session
      @user = User.find_by_id(params[:id])
      if @user.destroy
        redirect to '/logout'
      end
    else
      redirect to '/login'
    end
  end

end

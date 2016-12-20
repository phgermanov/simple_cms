class AccessController < ApplicationController

  layout 'admin'
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def menu
    @admin_user = AdminUser.find(session[:user_id])
  end

  def login

  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:name] = authorized_user.first_name
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password"
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    flash[:notice] = "Logged out"
    redirect_to(access_login_path)
  end

end

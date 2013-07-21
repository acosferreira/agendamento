class AdminController < ApplicationController
  layout "application", :except => [:login, :logout]
  def login
    session[:user_id] = nil
    if request.post?
      if Usuario.authenticate(params[:login], params[:password])
        user = Usuario.find_by_login(params[:login])
        session[:user_id]= user.id
        session[:user_login] = params[:login]
        session[:user_password]=params[:password]
        session[:user_name] = user.name
        redirect_to(:controller=> "agendas", :action => "index")
      else
        flash[:notice] = 'Invalid user/password combination'
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
end
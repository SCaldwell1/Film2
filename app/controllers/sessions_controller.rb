class SessionsController < ApplicationController
  def new
  end

  def create
	user=User.find_by_email(params[:email])
	if user&&user.authenticate(params[:password])
		session[:user_id]=user.id #stores the id in the session
		redirect_to user #displays the user/show view
	else
		flash.now[:error]="Invalid email/password combination"
		render 'new' #shows login page again
	end
  end

  def destroy
	if logged_in?
		session[:user_id]=nil
	else
		flash[:notice]="You need to log in first"
	end
	redirect_to login_path
  end
end

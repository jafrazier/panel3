class SessionsController < ApplicationController
  def new
  end

  def create
    @instructor = Instructor.find_by_email(params[:session][:email])
      if @instructor && @instructor.authenticate(params[:session][:password])
          session[:user_id] = @instructor.id
          redirect_to pages_home_path
      else
        redirect_to '/'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

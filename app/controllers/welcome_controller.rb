class WelcomeController < ApplicationController

  def index
  end

  def login
    render :layout => false
  end

  def auth
    @owner = Owner.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @owner
      session[:current_user] = @owner.id
      @dog = @owner.dogs.first
      session[:current_dog] = @dog.id
      redirect_to @dog
    else
      flash[:login_error] = "Invalid username/password combination"
      redirect_to '/'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
end


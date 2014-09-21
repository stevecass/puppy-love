class OwnersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @owner = Owner.new
  end

  def create
  	puts params
  	if Owner.find_by(email: params[:email])
  		flash[:signup_error] = "Email already exists. Please login."
  		redirect_to '/'
  	elsif params[:password] == params[:password_confirm]
  		@owner = Owner.create(email: params[:email], password: params[:password])
  		session[:current_user] = @owner.id
  		redirect_to new_dog_path
  	elsif params[:password] != params[:password_confirm]
  		flash[:signup_error] = "Passwords don't match"
  		redirect_to '/'
  	end
  end

  private

  def require_login
    unless session[:current_user]
      flash[:login_error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
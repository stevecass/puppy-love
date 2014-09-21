class DogsController < ApplicationController
  before_action :require_login

  def index 
    #this action should pull up 100 or so dogs from the DB
    # and then display them to the user.
    # If any filtering criteria are selected, a new query 
    # will run, and 100 new results matching that query will
    # be dislayed.  
  end

  def show
    @dog = Dog.find(params[:id].to_i)
    # Should query for an individual dogs profile, and display that.
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.save
    @owner = Owner.find(session[:current_user])
    @owner.dogs << @dog
    redirect_to @dog
    
  end

  def edit  
    @dog = Dog.find(params[:id].to_i)
    #form to edit your own profile
  end

  def update
    @dog = Dog.find(params[:id].to_i)
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
    #update your profile
  end

  def destroy
    #delete your own account
  end

  private
  def dog_params
    params.require(:dog).permit(
      :gender,
      :breed,
      :size,
      :birthday,
      :location,
      :tagline,
      :bio,
      :photo_url,
      :name
    )
  end
 
  def require_login
    unless session[:current_user]
      flash[:login_error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
class DogsController < ApplicationController
  before_action :require_login

  ############################################################


  def index
    @filterrific = Filterrific.new(
      Dog,
      params[:filterrific] || session[:filterrific_dogs]
    )

    @filterrific.select_options = {
      sorted_by: Dog.options_for_sorted_by,
    }

    session[:filterrific_dogs] = @filterrific.to_hash

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end
  end


  ############################################################

  def show
    @dog = Dog.find(params[:id].to_i)
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
  end

  def update
    @dog = Dog.find(params[:id].to_i)
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
  end

  def destroy
    @dog = Dog.find(params[:id].to_i)
    if @dog.owner_id == session[:current_user]
      @dog.destroy
      redirect_to root_path
    else
      render 'edit'
    end
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
class DogsController < ApplicationController
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
    #return signup form to create an account?
    # Should this go here or in the owner controller?
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
      :bio
    )
  end

end
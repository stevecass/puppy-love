class DogsController < ApplicationController
  def index 
    #this action should pull up 100 or so dogs from the DB
    # and then display them to the user.
    # If any filtering criteria are selected, a new query 
    # will run, and 100 new results matching that query will
    # be dislayed.  
  end

  def show
    # Should query for an individual dogs profile, and display that.
  end

  def new
    #return signup form to create an account?
    # Should this go here or in the owner controller?
  end

  def edit  
    #form to edit your own profile
  end

  def update
    #update your profile
  end

  def destroy
    #delete your own account
  end

end
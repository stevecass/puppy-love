class WelcomeController < ApplicationController

  def index
    #show a cool web 2.0 splash page of a dog
  end

  def login
    #user login form
    render :layout => false
  end

  def auth
    @owner = Owner.find_by(email: params[:email]).try(:authenticate, params[:password])
    puts @owner
    if @owner
      session[:current_user] = @owner.id  
      redirect_to @owner.dog
    else
      flash[:login_error] = "Invalid username/password combination"
      redirect_to '/'
    end
    #process login form and authorize user
    #set session info on auth
    #redirect to welcome#home on auth
    #either redirect to welcome#index on auth fail, or popup 
    #an error message on the form.
  end

  def home
    #Should go to a dogs homepage once logged in.
    #Victor's note - I skipped this route since I should be able to redirect straight to the dog's profile once i get there
  end

  def logout
    session.clear
    redirect_to '/'
    #clear the current session
    #redirect to welcome#index
  end
end


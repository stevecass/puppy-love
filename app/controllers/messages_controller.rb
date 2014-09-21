class MessagesController < ApplicationController
  before_action :require_login

  def index
    #Show all messages you have sent and received
    #This should probably just run the query to
    # get all the users messages, and the view
    # should show them separated by sent or recieved.
    @dog = Dog.find_by(owner_id: session[:current_user])
  end

  def show
    #Show an indivudual message, and any comments that
    #that message has.
    @message = Message.find(params[:id])
  end

  def new
    #form to create a new message
    @message = Message.new
    @dog = Dog.find_by(owner_id: session[:current_user])
  end

  def create
    #create a new message
    @dog = Dog.find(params[:message][:sender])
    receiving_dog = Dog.find(params[:message][:recipient])
    @dog.sent_messages.create(recipient_id: receiving_dog.id, content: params[:message][:content])
    redirect_to '/messages'
  end

  def edit
    #Should this be allowed? Changing a message after sending it?
  end

  def update
    #same as edit.
  end

  def destroy
    #delete a message from your end..
    # message should still remain in the other parties messages.
    #ie: me deleting a message I sent you doesnt also remove it from
    # your inbox.
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to '/messages'
  end

  private

  def require_login
    unless session[:current_user]
      flash[:login_error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end

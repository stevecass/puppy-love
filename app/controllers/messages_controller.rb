class MessagesController < ApplicationController
  before_action :require_login

  def index
    @dog = Dog.find(session[:current_dog])
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @dog = Dog.find_by(owner_id: session[:current_user])
  end

  def create
    @dog = Dog.find(session[:current_dog])
    receiving_dog = Dog.find(params[:message][:recipient_id])
    @dog.sent_messages.create(recipient_id: receiving_dog.id, content: params[:message][:content])
    redirect_to '/messages'
  end

  def edit
  end

  def update
  end

  def destroy
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

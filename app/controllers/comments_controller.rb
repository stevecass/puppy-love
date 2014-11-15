class CommentsController < ApplicationController
  before_action :require_login

  def index
    
  end

  def show
  
  end 

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
    p comment
    render 'dogs/_comment', locals: {:comment => comment}, layout: false
  end

  def edit
    
  end

  def update
    #update the contents
  end

  def destroy
    Comment.find(params[:id]).destroy
    render text: "Comment deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :commentable_id, :commentable_type, :content)
  end

  def require_login
    unless session[:current_user]
      flash[:login_error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end


end
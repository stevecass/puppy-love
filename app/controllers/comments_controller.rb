class CommentsController < ApplicationController

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
    #destroy comment
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :commentable_id, :commentable_type, :content)
  end

end
class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.create(params[:comment])
    @comment.idea.update_attribute(:updated_at, Time.now)

    redirect_to @comment.idea
  end
end

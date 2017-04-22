class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params);
    @comment.article_id = params[:article_id];

    @comment.save
    flash.notice = "Your comment has been posted!";
    redirect_to article_path(@comment.article_id)
  end

  def comment_params
    return params.require(:comment).permit(:author_name, :body);
  end
end

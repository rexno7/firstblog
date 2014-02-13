class CommentsController < ApplicationController

  http_basic_authenticate_with name: "thisguy", password: "duhme", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  end
  
  def delete
    @post = Post.find(params[:post_id])
    @oomment = @post.commments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  private
    def comment_params
      params[:comment].permit(:commenter, :body)
    end

end

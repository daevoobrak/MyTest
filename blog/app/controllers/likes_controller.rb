class LikesController < ApplicationController
  
  def like
    #puts "33333333333"
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:comment_id])
    @action = @comment.likes.new(like_params)
    @action.save!
    
    session[:c_id] = params[:comment_id]
    redirect_to article_path(@article)
  end

  def dislike
    puts "dislikeeeddd"
  end

  private
    def like_params
      params.require(:like).permit(:like,:dislike)
    end
end

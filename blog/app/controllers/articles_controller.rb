class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "dp", password: "singh", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @c_id = session[:c_id]
    @comment = Comment.find(@c_id)
    @l,@d = count(@comment)
  end

  def count(comment)
    l=0
    d=0
    comment.likes.each do |a|
      if a.dislike.blank?
        l=l+1
      else
        d=d+1
      end
    end
    return l,d
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

  

end

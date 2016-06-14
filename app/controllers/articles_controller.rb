class ArticlesController < ApplicationController

  def index
    @articles = current_user.articles.reverse
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)

    p = Photo.new(params[:photo])
    @article.photos << p
    p.save!
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end


  def show
  end

  def destroy
    article = Article.find_by_id(params[:id])
    article.destroy
    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:body, :title, :status, photo: [:imageable] )
  end
end

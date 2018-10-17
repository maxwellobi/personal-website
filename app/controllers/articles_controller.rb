class ArticlesController < ApplicationController
  
  def index
    @articles = []

    if session[:user_id]
      @articles = Article.eager_load(:tags).order(created_at: :desc)
    else 
      @articles = Article
                .where(:published => true)
                .eager_load(:tags)
                .order(created_at: :desc)
    end 

  end

  def show
    @article = Article
        .where(:published => true)
        .find_by_slug(params[:id])
  end

  def tag
    @tagged_articles = []

    if session[:user_id]
      @tagged_articles = Tag.where(:tag => params[:tag])
                .eager_load(:article)
                .order(created_at: :desc)
    else 
      @tagged_articles = Tag.where(:tag => params[:tag])
                .eager_load(:article)
                .where("articles.published = ?", true)
                .order(created_at: :desc)
    end 

  end

  # index, show, new, edit, create, update and destroy

end

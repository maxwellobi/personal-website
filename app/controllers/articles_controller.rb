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
    @article = Article.find_by_slug(params[:id])
  end

  def new

  end


  # index, show, new, edit, create, update and destroy

end

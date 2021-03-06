class ArticlesController < ApplicationController
  
  def index
    @articles = []

    if session[:user_id]
      @articles = Article
                .paginate(:page => params[:page], :per_page => 4)
                .eager_load(:tags).order(published_at: :desc)
    else 
      @articles = Article
                .paginate(:page => params[:page], :per_page => 4)
                .where(:published => true)
                .eager_load(:tags)
                .order(published_at: :desc)
    end 

  end

  def show

    @article = nil
    if session[:user_id] 
      @article = Article.find_by_slug(params[:id])
    else 
      @article = Article
          .where(:published => true)
          .find_by_slug(params[:id])
    end

    if @article
      @site_name = @article.title + " | Maxwell Obi"
      @site_desc = helpers.get_excerpt(@article.article, 35)
    else 
      not_found
    end
    
  end

  def tag
    @tagged_articles = []

    if session[:user_id]
      @tagged_articles = Tag.where(:tag => params[:tag])
                .eager_load(:article)
                .paginate(:page => params[:page], :per_page => 4)
                .order(created_at: :desc)
    else 
      @tagged_articles = Tag.where(:tag => params[:tag])
                .eager_load(:article)
                .where("articles.published = ?", true)
                .paginate(:page => params[:page], :per_page => 4)
                .order(created_at: :desc)
    end 

  end

  # index, show, new, edit, create, update and destroy

end

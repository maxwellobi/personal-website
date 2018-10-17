class Sudo::ArticlesController < AdminController
  
  before_action :require_login

  def new

    @article = Article.new
    @article_publish_date = Time.now.strftime("%d/%m/%Y").to_s
    @article_tags = "";

  end
  
  def edit
    @article = Article.includes(:tags).find(params[:id])

    if @article
      @article_publish_date = @article.published_at.strftime("%d/%m/%Y")
      @article_tags = @article.tags.collect { |v| v.tag.strip }.join(", ")
    end
  end

  def create
     
    article_params = _params

    article_params[:slug] = helpers.slugize(article_params[:slug])
    article_params[:slug] = helpers.slugize(article_params[:title]) if article_params[:slug].blank?
   
    tag_list = article_params[:tags];
    article_params.delete(:tags)

    @article = Article.new(article_params)
    if @article.valid?

      if !tag_list.blank?
        
        tag_list = tag_list.split(',')
        tag_list.each { |t|
          @article.tags.build(tag: t.strip)
        }

      end

      redirect_to root_url if @article.save

    else
      render 'new'
    end
    
  end

  def update 
    @article = Article.includes(:tags).find(params[:id])

    article_params = _params
    article_params[:slug] = helpers.slugize(article_params[:slug])
    article_params[:slug] = helpers.slugize(article_params[:title]) if article_params[:slug].blank?
   
    tag_list = article_params[:tags];
    article_params.delete(:tags)

    if @article.valid?

      @article.tags.destroy_all
      
      if !tag_list.blank?
        
        tag_list = tag_list.split(',')
        tag_list.each { |t|
          @article.tags.build(tag: t.strip)
        }

      end

      if @article.update(article_params)
        flash[:primary] = "Article Updated Successfully";
        redirect_to root_url 
      else
        render 'edit'
      end

    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash[:primary] = "Article  Deleted Successfully";
    redirect_to root_url
  end

  private

    def _params
      params.require(:article).permit(:title, :slug, :published, :published_at, :tags, :article)
    end 

    def require_login
      if !session[:user_id]
          session[:return_url] = request.url
          redirect_to sudo_login_path
      end
    end
end
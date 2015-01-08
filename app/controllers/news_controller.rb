class NewsController < ApplicationController
  before_filter :ensure_best_url, only: :show
  before_filter :set_nav_and_footer_links

  # GET /news
  # GET /news.json
  def index

    @news = News.all_for_website(website)
    @hide_archive = false

    respond_to do |format|
      format.html { render_template } # index.html.erb
      format.xml  { render xml: @news }
    end
     
  end

  # GET /news/archived
  # GET /news/archived.xml
  def archived
    @news = News.archived(website)
    respond_to do |format|
      format.html { render_template } # archived.html.erb
      format.xml  { render xml: @news }
    end
  end 

  # GET /news/1
  # GET /news/1.json
  def show

   # @old_news = !!(News.archived(website))
   # @recent_news = News.all_for_website(website, limit: 6) - [@news]
    respond_to do |format|
      format.html { render_template } # show.html.erb
      format.xml  { render xml: @news }
    end
     
  end

  private
    
 def ensure_best_url
   # use slug for the friendly ID
     # @news = News.includes(:products)
      #.joins(
      #'LEFT JOIN news_categories ON news.news_category_id = news_categories.id ',
      #'LEFT JOIN products_news ON news.id = products_news.news_id ',
     # 'LEFT JOIN products ON products_news.product_id = products.id '
     # )
      @news = News.where(slug: params[:id]).first || News.find(params[:id])
 end
  
end

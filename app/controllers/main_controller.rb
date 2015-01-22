class MainController < ApplicationController
  helper :all 
  before_filter :set_nav_and_footer_links

  def search 
    
        @query = sanatize_search_string(params[:query])
        
        @products = Product.search_keywords(@query)
        @downloads = Download.search_keywords(@query)
        @news = News.search_keywords(@query)
        @pages = Page.search_keywords(@query)
        @videos = Video.search_keywords(@query)
        #@kbs = Knowledgebase.search_keywords(@query)
        
        @runner = @products.length + @downloads.length + @news.length + @pages.length +  @videos.length # + @kbs.length

       

  end
  
  private
  
  def sanatize_search_string(search)
    #quick propanity check, will need to add in db check at a later date
    search.gsub(/[\/\\]/,'')
    search.gsub('fuck' ,'')
    search.gsub('wank' ,'')
    search.gsub('sex' ,'')
    search.gsub('cunt' ,'')
    search.gsub('pussy' ,'')
    search.gsub('penis' ,'')
    
  end
  
  
end

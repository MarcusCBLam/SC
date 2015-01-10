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

  end
  
  private
  
  def sanatize_search_string(search)
    
    matchers = {  /[\/\\]/ => ' ', 
                 '/soundcraft/i' => ' '}
    search.gsub(/[\/\\]|soundcraft/i) { |match| matchers[match] }
    
  end
  
  
end

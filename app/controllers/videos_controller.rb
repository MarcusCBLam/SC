class VideosController < ApplicationController  
  before_filter :set_nav_and_footer_links
  
  
  def index
    

    if params[:id]
      @video_cat = VideoCategory.find_by id: params[:id]
    else
      @video_cat = VideoCategory.find_by id: 1
    end
    

  end
  

end

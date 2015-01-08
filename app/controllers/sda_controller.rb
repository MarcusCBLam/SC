class SdaController < ApplicationController  
  before_filter :set_nav_and_footer_links
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  
  def index

      

  end

end

class SdaController < ApplicationController  
  before_filter :set_nav_and_footer_links
  before_action :authenticate_sda_user!
  protect_from_forgery with: :exception
  
  
  def index

      

  end
  
  def downloads
    
  end
  
  def dealer_contacts
    
  end
  
  def order_forms
    
  end
  
  def swags
    
    
  end
  
  def our_people
    
  end
  
  
  

end

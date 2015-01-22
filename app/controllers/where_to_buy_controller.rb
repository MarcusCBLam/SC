class WhereToBuyController < ApplicationController  
  before_filter :set_nav_and_footer_links
  before_filter :geoip
  
  
  def index
    
    #@countries = Country.where(name: @geoip.country_name)
    #@distributors = Distributor.where(country_id: 94)
    @country_ddl = Country.order(:position, :name)
    
  end
  



end

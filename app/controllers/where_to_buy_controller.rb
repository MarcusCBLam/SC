class WhereToBuyController < ApplicationController  
  before_filter :set_nav_and_footer_links
  
  
  def index
    
    require 'geoip'
    #@info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(ip_request_params[:host])
    #@info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(request.remote_ip)
    @info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city('82.31.117.27')
    
  end
  
  private
  def ip_request_params
    params.require(:request).permit(:host)
  end

end

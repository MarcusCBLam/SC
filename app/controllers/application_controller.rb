class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :catch_criminals
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout :set_layout

  def set_layout
    template = 'application'
    #if (website && website.folder) 
    #  controller_brand_specific = "layouts/#{controller_path}"
    #  brand_specific = "layouts/application"
    #  homepage = "layouts/home"
    #end  
   # template
  end

  def render_template(options={})
    default_options = {controller: controller_path, action: action_name, layout: set_layout}
    options = default_options.merge options
    root_folder = (website && website.folder) ? "#{website.folder}/" : ''
    brand_specific = "#{root_folder}#{options[:controller]}/#{options[:action]}"
    generic = "#{options[:controller]}/#{options[:action]}"
    template = (File.exists?(Rails.root.join("app", "views", "#{brand_specific}.html.erb"))) ? brand_specific : generic
    logger.debug "------> Brand template: #{brand_specific}"
    logger.debug "----------------------------> Selected Template: #{template}"
    render template: template, layout: options[:layout]
  end  

  def set_default_meta_tags
    begin
      @page_description = website.value_for('default_meta_tag_description')
      @page_keywords = website.value_for("default_meta_tag_keywords")
    rescue
      @page_description = ""
      @page_keywords = ""
    end
  end

# set everything below to private  
private

def set_locale
  I18n.locale = "en"
end

def website

 # p "controller/application_controller.rb | def website"
    @website ||= Website.where(url: request.host).first
    
end 
helper_method :website


  def catch_criminals
    begin
      x = request.env["HTTP_X_FORWARDED_FOR"].to_s
      i = request.remote_ip.to_s
      if x.match(/198\.91\.53/) || i.match(/198\.91\.53/) || x.match(/162\.211\.152/) || i.match(/162\.211\.152/)
        # send this idiot back to his own ISP
        redirect_to "http://www.securitymetrics.com#{ENV['REQUEST_URI']}" and return false
      end
    rescue
    end
  end
  
  def set_nav_and_footer_links
    
     @ProductCategories   = ProductCategory.where(live: 1).order(:position)
     @Product             = Product.where(live: 1, hidden: 0).order(:position)
     
     @FooterAboutUsLinks  = MenuPage.includes(:page).where(live: 1).where(menu: "footer-about-us").order(:position)
     @FooterSupportLinks  = MenuPage.includes(:page).where(live: 1).where(menu: "footer-support").order(:position)
     @FooterMWPLinks      = MenuPage.includes(:page).where(live: 1).where(menu: "footer-mwp").order(:position)
     
     @NavMediaLinks       = MenuPage.includes(:page).where(live: 1).where(menu: "header-media").order(:position)
     @NavWhatsOnLinks     = MenuPage.includes(:page).where(live: 1).where(menu: "header-whats-on").order(:position)
     @NavSupportLinks     = MenuPage.includes(:page).where(live: 1).where(live: 1).where(menu: "header-support").order(:position)
     @NavSDALinks         = MenuPage.includes(:page).where(live: 1).where(menu: "header-sda").order(:position)
     
  end
  
  def geoip
    
    require 'geoip'
    #ip = request.remote_ip
    ip = '82.31.117.27'
    #@info = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(ip_request_params[:host])
    @geoip = GeoIP.new(Rails.root.join("GeoLiteCity.dat")).city(ip)
    
      #def ip_request_params
      #params.require(:request).permit(:host)
      #end
  
  end
 

  #DEVISE
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
   sda_user_root_path
  end

 


  
end



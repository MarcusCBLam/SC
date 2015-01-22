# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Generates a link to the current page, with the given locale
  def switch_locale(new_locale)
    request.path.sub(/^\/[a-zA-Z\-]{2,5}/, "/#{new_locale}")
  end

  # Apple iOS icons for a given Website.brand
  #
  def app_meta_tags(options={})
    p "application_helper.rb | def app_meta_tags | START "
    if website
      p "application_helper.rb | def app_meta_tags | TRUE "
      default_options = { folder: website.folder, title: "Soundcraft", status_bar_color: "black" }
    else
      p "application_helper.rb | def app_meta_tags | FALSE "
      default_options = { folder: "", title: "", status_bar_color: "black" }
    end
    options = default_options.merge options
    
    ret =  tag(:meta, name: "apple-mobile-web-app-capable", content: "yes")
    ret += tag(:meta, name: "apple-mobile-web-app-status-bar-style", content: options[:status_bar_color])
    ret += tag(:meta, name: "apple-mobile-web-app-title", content: options[:title] )
    ret += tag(:meta, name: "format-detection", content: "telephone=no")

    # only one dimension needed, half-size (non-retina) sizes.
    sizes = [29, 40, 50, 57, 60, 72, 76].sort.reverse

    sizes.each do |size|
      # retina versions:
      if File.exists?(Rails.root.join("app", "assets", "images", options[:folder], "AppIcon#{size}x#{size}@2x.png"))
        ret += tag(:link, rel: "apple-touch-icon", sizes: "#{size*2}x#{size*2}", href: image_path("#{options[:folder]}/AppIcon#{size}x#{size}@2x.png") )
      end
    end
    sizes.each do |size|
      if File.exists?(Rails.root.join("app", "assets", "images", options[:folder], "AppIcon#{size}x#{size}.png"))
        ret += tag(:link, rel: "apple-touch-icon", sizes: "#{size}x#{size}", href: image_path("#{options[:folder]}/AppIcon#{size}x#{size}.png") )
      end
    end

    ret.html_safe
  end

  # Using zurb foundation to show the site's logo
  #
  def interchange_logo
    q = []
    q << "[#{image_path("#{website.folder}/logo.png")}, (default)]"
    q << "[#{image_path("#{website.folder}/logo.png")}, (large)]"
    q << "[#{image_path("#{website.folder}/logo.png")}, (medium)]"
    q << "[#{image_path("#{website.folder}/logo-sm.png")}, (only screen and (max-width: 720px))]"

    image_tag('', #"#{website.folder}/logo.png",
      class: "no-resize no-resize-for-small",
      alt: Setting.site_name(website),
      data: { interchange: q.join(", ") })
  end

  # Remove HTML from a string (helpful for truncated intros of
  # pre-formatted HTML)
  def strip_html(string="")
    begin
      string = string.gsub(/<\/?[^>]*>/,  "")
      string = string.gsub(/\&+\w*\;/, " ") # replace &nbsp; with a space
      string.html_safe
    rescue
      raw("<!-- error stripping html from: #{string} -->")
    end
  end

  # Capitalize the first letter of each word in a phrase
  def ucfirst(my_string)
    raw(my_string.split(" ").each{|word| word.capitalize!}.join(" "))
  end


  # Platform icon. Make sure there are icons for all the different platforms and sizes
  # in the public/images folder
  def platform_icon(software, size=17)
    img = case software.platform.to_s
      when /windows/i
        "icons/windows_#{size}.png"
      when /mac/i
        "icons/mac_#{size}.png"
      when /linux/i
        "icons/tux_#{size}.png"
      when /ios/i
        "icons/iOS_#{size}.png"
      when /android/i
        "icons/android_#{size}.png"
      else
        "icons/none_#{size}.png"
    end
    image_tag img, style: "vertical-align: middle"
  end

  def seconds_to_HMS(time)
    time = time.to_i
    [time/3600, time/60 % 60, time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
  end

  def seconds_to_MS(time)
    time = time.to_i
    [time/60 % 60, time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
  end


  # Tries to find a ContentTranslation for the provided field for current locale. Falls
  # back to language only or default (english)
  def translate_content(object, method)
    c = object[method] # (default)
    return c if I18n.locale == I18n.default_locale || I18n.locale == 'en'
    parent_locale = (I18n.locale.to_s.match(/^(.*)-/)) ? $1 : false
    translations = ContentTranslation.where(content_type: object.class.to_s, content_id: object.id, content_method: method.to_s)
    if t = translations.where(locale: I18n.locale).first
      c = t.content
    elsif parent_locale
      if t = translations.where(locale: parent_locale).first
        c = t.content
      elsif t = translations.where(["locale LIKE ?", "'#{parent_locale}%%'"]).first
        c = t.content
      end
    elsif auto = auto_translate(object, method)
      c = auto
    end
    c.to_s.html_safe
  end



  def image_url(source)
    abs_path = image_path(source)
    unless abs_path =~ /^http/
      abs_path = "#{request.protocol}#{request.host_with_port}#{abs_path}"
    end
    abs_path
  end

  # Replacement for render :partial, this version considers the
  # site's brand and checks for a custom partial.
  def render_partial(name, options={})
    if File.exists?(Rails.root.join("app", "views", "layouts", "#{name.gsub(/\/(?!.*\/)/, "/_")}.html.erb"))
      name = "#{website.folder}/#{name}"
    end
    eval("render '#{name}', options")
  end

  # footer brand links #################################
  def hpro_footer()

    hpro_links = []
    hpro_links << link_to(image_tag("pro_brands/harmanpro.png", alt: "HarmanPro", class: " hover_up"), "http://www.harmanpro.com", target: "_blank")

    pro_brands = [
      {name: "AKG",    web: "http://www.akg.com"},
      {name: "AMX",    web: "http://www.amx.com"},
      {name: "BSS",    web: "http://www.bssaudio.com"},
      {name: "Crown",  web: "http://www.crownaudio.com"},
      {name: "dbx",    web: "http://www.dbxpro.com"},
      {name: "JBL",    web: "http://www.jblpro.com" },
      {name: "Lexicon",    web: "http://www.lexiconpro.com"},
      {name: "Martin",  web: "http://www.martin.com"},
      {name: "Soundcraft", web: "#"},
      {name: "Studer", web: "http://www.studer.ch"}
    ]
    pro_brands.each do |b|
           hpro_links << link_to(image_tag("pro_brands/#{b[:name].downcase}.png", alt: b[:name], class: " hover_up"), b[:web], target: "_blank") 
    end
    
    content_tag(:div, raw(hpro_links.join), id: "harmanpro_bar" )
    
  end

  #footer social links #################################
  def social_gray_buttons()

    links = []
   
    social_links = [
      {name: "facebook",    web: ENV['FACEBOOK_URL']},
      {name: "twitter",    web: ENV['TWITTER_URL']},
      {name: "youtube",    web: ENV['YOUTUBE_URL']},
      {name: "linkedin",  web: ENV['LINKEDIN_URL']},
      {name: "instagram",  web: ENV['INSTAGRAM_URL']}
    ]
    social_links.each do |b|
        links << link_to(image_tag("social/social-gray-#{b[:name].downcase}.png", alt: b[:name], class: "no-resize hover_up"), b[:web], target: "_blank") 
    end
    
    content_tag(:div, raw(links.join), id: "social_bar" )
    
  end
  

  # HEADER NAV MENUS #############################################
  
  def create_product_category_nav_links(cat_id,cat_name)
   
    child_content_tags = ''
    products_content_tags = ''
   
    case cat_id 
      when 4  
      #override with shortcuts for recording interfaces 
      recording_interfaces_nav_items(1, cat_name)
      else
        
        @product_sub_categories = ProductSubCategory.all_with_prod_cat(cat_id)
   
        if @product_sub_categories.count > 0
          
          @product_sub_categories.each do |cat|
            child_content_tags << create_product_sub_category_nav_links(cat.id,cat.name,cat_name)
          end
          
          #temporarily disable discontinued products I have more time.
          #if cat_id == 1
          #  child_content_tags << content_tag(:li, link_to("Discontinued Products", "/products/discontinued-products"))
          #end
          
          parent_tag = content_tag(:a, cat_name, href: "/products/#{urlise(cat_name)}")
          ul_tag = content_tag(:ul, child_content_tags.html_safe, class: "dropdown")
          content_tag(:li , parent_tag + ul_tag, class: "has-dropdown")
         
        else
    
           products_content_tags = create_product_nav_links("category", cat_id, cat_name)
           parent_tag = content_tag(:a, cat_name, href: "/products/#{urlise(cat_name)}")
           ul_tag = content_tag(:ul, products_content_tags.html_safe, class: "dropdown")
           content_tag(:li , parent_tag + ul_tag, class: "has-dropdown")
           
        end
         
      end
  
 end
 
 def create_product_sub_category_nav_links (sub_cat_id,sub_cat_name, cat_name)
   
       child_content_tags = create_product_nav_links("sub-category", sub_cat_id, sub_cat_name)
       parent_tag = content_tag(:a, sub_cat_name, href: "/products/#{urlise(cat_name)}/#{urlise(sub_cat_name)}")
       ul_tag = content_tag(:ul, child_content_tags.html_safe, class: "dropdown")
       content_tag(:li , parent_tag + ul_tag, class: "has-dropdown")

 end
 
 def create_product_nav_links(ctype, id, name)
   products_content_tags = ''
   
   if ctype == "category" 
     @product = Product.all_with_prod_cat_id(id)
   else 
     @product = Product.all_with_prod_sub_cat_id(id)
   end  

   @product.each do |prod|     
      products_content_tags << content_tag(:li, link_to(prod.name, "/products/#{urlise(prod.name)}"))
   end
      
   return  products_content_tags
       
 end
 
 def  recording_interfaces_nav_items(cat_id, cat_name)
 
   child_content_tags = ''
   
        @product_sub_categories = ProductSubCategory.all_with_prod_cat(cat_id)
   
        if @product_sub_categories.count > 0
          
          @product_sub_categories.each do |cat|
            if cat.id == 5
              child_content_tags << create_product_sub_category_nav_links(cat.id,cat.name, cat_name)
            end
              
          end
             parent_tag = content_tag(:a, cat_name, href: cat_name.gsub(" ", "-").downcase)
             ul_tag = content_tag(:ul, child_content_tags.html_safe, class: "dropdown")
             content_tag(:li , parent_tag + ul_tag, class: "has-dropdown")
        end
 end
 
 def prefix_brand(product)
   branded = website.brand.name + ' ' + product
 end
 
 def urlise(str)
   urlised = str.gsub(" ", "-").downcase
 end
  
end

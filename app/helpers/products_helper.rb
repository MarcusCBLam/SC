module ProductsHelper
  
  def write_product_application_string(pid)
    
    str = "Recommmended for:  "
    ProductsApplication.where(product_id: pid).each do |app|
      str +=  image_tag(asset_path("images/sc_check.png"), class: "margin-left") + app.application.name
    end
    str.html_safe
    
  end
  
   def write_product_section_menu(pid)
     
     str_menu = ""
     ProductsSection.where(product_id: pid).order(:position).each_with_index do |ps, index|
      if index == 0
        str_menu +=  "<li class=\"tab-title active\" role=\"presentational\" >"
      else
        str_menu +=  "<li class=\"tab-title\" role=\"presentational\" >"
      end
        str_menu +=  "<a class=\"panelToTop\" href=\"#panel-#{ps.id}\" role=\"tab\" tabindex=\"0\" aria-selected=\"true\" controls=\"#panel-#{ps.id}\" >"
        str_menu +=  ps.section.title
        str_menu +=  "</a>"
        str_menu +=  "</li>"
     end
      str_menu.html_safe
     
   end 
   
end

module VideosHelper
  
  
   def write_video_cat_menu()
     
     str_menu = ""
     VideoCategory.get_all_video_cats.each_with_index do |ps, index|
      #if index == 0
       # str_menu +=  "<li >"
      #else
        str_menu +=  "<li>"
      #end
        str_menu +=  "<a href=\"/videos/#{ps.id}\" >"
        str_menu +=  ps.name
        str_menu +=  "</a>"
        str_menu +=  "</li>"
     end
      str_menu.html_safe
     
   end 

end


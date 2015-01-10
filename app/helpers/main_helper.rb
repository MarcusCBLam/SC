module MainHelper

   def social_media_links(*networks)
    options = networks.last.is_a?(Hash) ? networks.pop : { size: "21x20"}
    html = ''
    networks.to_a.each do |n|
      
        if options[:style] && File.exist?(Rails.root.join("app/assets/images/icons/#{options[:style]}/#{options[:size]}", "#{n}.png"))
          q = []
          q << "[#{image_path("icons/#{options[:style]}/#{options[:size]}/#{n}.png")},  (default)]"
          q << "[#{image_path("icons/#{options[:style]}/#{options[:size]}/#{n}.png")}, (only screen and (min-width: 1350px))]"
          q << "[#{image_path("icons/#{options[:style]}/64x64/#{n}.png")},              (only screen and (min-width: 1024px) and (max-width: 1349px))]"
          q << "[#{image_path("icons/#{options[:style]}/48x48/#{n}.png")},             (only screen and (max-width: 768px))]"

          image_tag("#{website.folder}/logo.png",
            class: "no-resize no-resize-for-small",
            alt: Setting.site_name(website),
            data: { interchange: q.join(", ") })
          html += link_to(image_tag("icons/#{options[:style]}/#{options[:size]}/#{n}.png",
              style: "vertical-align: middle;",
              size: options[:size],
              class: "hover_up",
              data: { interchange: q.join(", ") }))
        else
          html += link_to(image_tag("icons/#{n}.png", style: "vertical-align: middle;", size: options[:size], class: "hover_up"), target: "_blank")
        end

    end
    raw(html)
  end
  
  def write_search_result_records(num, page)
    
    if num == 0
      "(1 " + page + " found)"
    elsif num > 1
       "(" + num.to_s + " " + page + "s found)"
    else
      "(1 " + page + " found)"
    end
    
  end
 
end
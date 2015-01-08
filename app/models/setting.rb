class Setting < ActiveRecord::Base


  belongs_to :brand, touch: true
  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:locale, :brand_id]
  

  
  # Wrapper to grab the site name
  def self.site_name(website)
    #begin
    #  where(brand_id: website.brand_id).where(name: "site_name").first.value
    #rescue
      "Soundcraft"
    #end
  end
  

  
  def fix_locale
    if self.locale.blank?
      self.locale = nil
    end
  end

  # Determines the value of the current Setting. Values can come
  # from the string, text, integer, or slide attachment. 
  def value(locale=I18n.locale)
    begin
      (self.setting_type =~ /slide/) ? self.slide : eval("self.#{self.setting_type}_value")
    rescue
      nil
    end
  end
  
end

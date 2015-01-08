class Website < ActiveRecord::Base
  belongs_to :brand, touch: true
  has_many :website_locales
  validates :url, presence: true, uniqueness: true
  validates :brand_id, presence: true
  validates :folder, presence: true
  
  def value_for(key, locale=I18n.locale)
    brand.value_for(key, locale)
  end

  def locale
    if self.default_locale && !self.default_locale.blank?
      self.default_locale
    elsif self.brand.default_locale && !self.brand.default_locale.blank?
      self.brand.default_locale
    else
      I18n.default_locale
    end
  end
  
  def brand_name
    @brand_name ||= self.brand.name
  end
  

end

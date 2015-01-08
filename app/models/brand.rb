class Brand < ActiveRecord::Base
  has_many :websites
  has_many :settings
  validates :name, presence: true, uniqueness: true
  
    
  def value_for(key, locale=I18n.locale)
    p "models/brand.rb : def value_for : #{key} : #{locale}"

  end

end

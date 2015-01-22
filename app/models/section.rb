class Section < ActiveRecord::Base
  
  has_many :products, through: :products_section
  has_many :products_sections, dependent: :destroy
  

end

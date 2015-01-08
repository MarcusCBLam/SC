class ProductCategory < ActiveRecord::Base
  
  has_many :product_sub_categories
  has_many :products
  
  


  def self.get_product_categories(locale)

  end 
  
  
  

end

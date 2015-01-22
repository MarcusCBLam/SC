class ProductsVideo < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :video
  

end

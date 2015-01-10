class ProductsDownload < ActiveRecord::Base
  
  belongs_to :download
  belongs_to :product
  
end

class ProductsNews < ActiveRecord::Base
  belongs_to :news
  belongs_to :product
end

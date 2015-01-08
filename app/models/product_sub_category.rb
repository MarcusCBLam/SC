class ProductSubCategory < ActiveRecord::Base
  
  belongs_to :product_category
  has_many :products
  
  def self.all_with_prod_cat(cat_id)
    
    where(product_category_id: cat_id).where(live: 1).order(:position)
  end
end

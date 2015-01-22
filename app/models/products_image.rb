class ProductsImage < ActiveRecord::Base
  
  belongs_to :product
  
    has_attached_file :image, styles: {
    thumb: '150x75>'
  },
    :path => "products/:style/:filename",
  :url => ':s3_domain_url'


end

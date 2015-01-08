class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :image, styles: {
    thumb: '200x100>',
    medium: '400x200>'
  } ,
  :path => "images/products/:style/:filename",
  :url => ':s3_domain_url'

  
  belongs_to :product_category
  belongs_to :product_sub_category
  
  has_many :products_news, dependent: :destroy
  has_many :news, through: :products_news
  has_many :users_products, dependent: :destroy
  

  
  def self.all_with_prod_cat_id(cat_id)
    where(product_category_id: cat_id).where(live: 1).order(:position)
  end  

  def self.all_with_prod_sub_cat_id(cat_id)
    where(product_sub_category_id: cat_id).where(live: 1).order(:position)
  end  
  
  def self.all_for_website_registration()
    where(registration_allowed: 1).order(:name)
  end
  
end

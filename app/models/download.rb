class Download < ActiveRecord::Base
  
  belongs_to :download_category
  belongs_to :download_sub_category
  
  has_many :products, through: :products_download
  has_many :products_download, dependent: :destroy 
  
  def self.search_keywords(search)
    where("keywords LIKE ? AND live = ?", "%#{search}%", 1).order(created_at: :desc ).first(100)
  end
  
  def self.get_all_for_product(prod, search)
    
  search_length = search.split.length
    if search_length > 1
      where(live: 1).where([(['keywords LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }).where(products_downloads: {product_id: prod}).first(100)
    else
      where("keywords LIKE ? AND live = ?", "%#{search}%", 1).where(products_downloads: {product_id: prod}).order(created_at: :desc ).first(100)
    end   


    
    
  end
  
end

class Download < ActiveRecord::Base
    extend FriendlyId
  friendly_id :slug, use: :slugged
  
  belongs_to :download_category
  belongs_to :download_sub_category
  
  has_many :products, through: :products_download
  has_many :products_download, dependent: :destroy 
  
    has_attached_file :download, 
                      :path => "downloads/:filename",
                      :url => ':s3_domain_url'
  
  
  
  
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
  
  def self.get_all_download_categories_for_product(prod_id)
    
    DownloadCategory.select(:name, :id).distinct
    .joins(downloads: :products_download)
    .where(downloads: {live: 1, public: 1})
    .where(products_downloads: {product_id: prod_id})
    .where(public: 1)

  end
  
  
  def self.get_all_downloads_for_product(prod_id, cat_id)
    
    distinct
    .joins(:products_download).where(products_downloads: {product_id: prod_id})
    .where(download_category_id: cat_id, live: 1, public: 1)
    .where(public: 1)
    .order(:position, :title)
    
    
  end
  
  
end

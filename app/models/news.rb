class News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } ,
  :path => "images/news/:style/:filename",
  :url => ':s3_domain_url'

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  has_many :products_news, dependent: :destroy
  has_many :products, through: :products_news
  
  belongs_to :news_category

  validates :name, presence: true
  validates :description, presence: true
  #attr_accessor :slug
  
  def sanitized_title
    self.title.gsub(/[\'\"]/, "")
  end
  
  # news within 6 months
  def self.all_for_website(website, options={})
    
      date_range = 6.months.ago..Date.today
      News.where(post_on: date_range)
      .order(post_on: :desc)

  end

  # News older than 6 months
  def self.archived(website)
      
      News.where("post_on < ?", 6.months.ago)
      .order(post_on: :desc)

   end
  
  # Alias for search results link name
  def link_name
    self.name
  end
  
  # Alias for search results content preview
  def content_preview
    "#{I18n.l(self.created_at.to_date, format: :long)} - #{self.body}"
  end
  
  def self.search_keywords(search)
    
    search_length = search.split.length
    if search_length > 1
      where(live: 1).where([(['keywords LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" }).order(post_on: :desc ).first(100)
    else
      where("keywords LIKE ? AND live = ?", "%#{search}%", 1).order(post_on: :desc ).first(100)
    end
    
  end
  
end

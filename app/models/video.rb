class Video < ActiveRecord::Base
  
  belongs_to :video_category
  belongs_to :video_sub_category
  has_many :products_videos
 
 
   def self.search_keywords(search)
     
   search_length = search.split.length
    if search_length > 1
      where(live: 1).where([(['keywords LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" })
    else
      where("keywords LIKE ? AND live = ?", "%#{search}%", 1)
    end
    
  end 
end

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
  
  
  def self.get_all_video_cat(cat, sub)
    if cat == 1 
      where(live: 1, featured: 1, video_sub_category_id: sub).order(:position, :title)
    else
      where(live: 1, video_category_id: cat, video_sub_category_id: sub).order(:position, :title)
    end
    
  end
  
    def self.get_product_videos(sub, prod_id)

      joins(:products_videos).where(products_videos: {product_id: prod_id}).where(live: 1, video_sub_category_id: sub).order(:position, :title)
      
      
    end  
  
  
  def self.get_video_sub_categories(cat_id)
    #select distinct s.name, s.id from videos v
    #left join video_sub_categories s ON v.video_sub_category_id = s.id
    #where v.video_category_id  = 12
    #order by s.position


   # distinct.pluck(video_sub_category: {:name, :id}).includes(:video_sub_category).where(video_category_id: cat_id).order(video_sub_category: {:position})
    
    
    
  end
  
end

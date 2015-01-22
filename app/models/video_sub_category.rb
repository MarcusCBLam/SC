class VideoSubCategory < ActiveRecord::Base
  
belongs_to :video_category
has_many :videos


def self.get_video_sub_cats(video_sub_category_id) 
  where(id: video_sub_category_id).order(:position)
end

end

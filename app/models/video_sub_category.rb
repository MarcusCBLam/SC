class VideoSubCategory < ActiveRecord::Base
  
belongs_to :video_category
has_many :videos

end

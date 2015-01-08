class VideoCategory < ActiveRecord::Base
  
  has_many :video_sub_categories
  has_many :videos
  

end

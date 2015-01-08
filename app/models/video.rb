class Video < ActiveRecord::Base
  
  belongs_to :video_category
  belongs_to :video_sub_category
  has_many :products_videos
  
end

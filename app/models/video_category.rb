class VideoCategory < ActiveRecord::Base
  
  has_many :video_sub_categories
  has_many :videos
  
  def self.get_all_video_cats
    where(live: 1).order(:position)
  end

end

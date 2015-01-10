class DownloadSubCategory < ActiveRecord::Base
  
  belongs_to :download_category
  has_many :downloads
  
  
  
end

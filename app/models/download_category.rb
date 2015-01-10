class DownloadCategory < ActiveRecord::Base
  
  has_many :download_sub_categories
  has_many :downloads

end

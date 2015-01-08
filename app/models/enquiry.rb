class Enquiry < ActiveRecord::Base
  
  has_many :users_enquiries

  def self.all_for_website()
    where(live: 1).order(:position)
  end
  
end

class Salutation < ActiveRecord::Base
  
  has_many :users

  def self.all_for_website()
    where(live: 1).order(:position)
  end
  
end

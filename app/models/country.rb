class Country < ActiveRecord::Base
  
  has_many :users

  def self.all_for_website()
    where(live: 1).order(:name)
  end
  
end

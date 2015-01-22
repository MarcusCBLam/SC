class Country < ActiveRecord::Base
  
  has_many :users
  has_many :distributors

  def self.all_for_website()
    order(:position, :name)
  end
  
end

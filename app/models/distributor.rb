class Distributor < ActiveRecord::Base
  
  belongs_to :country

  def self.get_distributors_details(local)
    
    where(live: 1).where(name: local)
    
  end
  
end

class Application < ActiveRecord::Base


  has_many :users_products, :dependent => :destroy
  


  def self.all_for_website_registration()
    where(live: 1).order(:name)
  end

end

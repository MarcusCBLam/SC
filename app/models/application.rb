class Application < ActiveRecord::Base


  has_many :users_products, :dependent => :destroy
  has_many :products, through: :products_application
  has_many :products_applications, dependent: :destroy
  


  def self.all_for_website_registration()
    where(live: 1).order(:name)
  end

end

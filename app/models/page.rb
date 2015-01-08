class Page < ActiveRecord::Base

  has_many :menu_pages
  

  def self.get_page(lcl) 
    Page.where(lcl_name: lcl)
  end

end
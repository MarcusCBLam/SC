class UsersEnquiry < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :enquiry
  belongs_to :product
  
  
  
  
end

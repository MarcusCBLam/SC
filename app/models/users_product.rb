class UsersProduct < ActiveRecord::Base
  
    belongs_to :user
    belongs_to :product
    belongs_to :application
  
    validates  :product_id, :serial, :purchased_date, presence: true
    validates  :serial, presence: true
  
end

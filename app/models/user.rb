class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :users_enquiries, :dependent => :destroy
  accepts_nested_attributes_for :users_enquiries
  
  has_many :users_products, :dependent => :destroy
  accepts_nested_attributes_for :users_products
  
  has_many :users_requests, :dependent => :destroy
  accepts_nested_attributes_for :users_requests
  
  belongs_to :salutation
  belongs_to :country
  
  validates :first_name, :last_name, :country, presence: true
  validates :email, presence: true, format: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i 
 # after_create :send_email_confirmation

  
end

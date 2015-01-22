class SupportController < ApplicationController  
  before_filter :set_nav_and_footer_links
  
  
  def index

      

  end
  
  def contact_us
    
    if request.post?
       
      if verify_recaptcha 
        
         @user = User.new(users_enquiry_params)
        if @user.save
          # need to send email
          flash[:notice] = "Your enquiry has been sent."
          redirect_to contact_us_path

        end

      end  
    else
      
      @user = User.new
      users_enquiry = @user.users_enquiries.build
    end
    
  end
  
  def product_registration
    
    if request.post?
      @user = User.new(users_product_params)
      if @user.save
         flash[:notice] = "Thank you for registering your product. It's all done now."
        redirect_to product_registration_path
      end
    else
      @user = User.new
      users_product = @user.users_products.build
    end
    
  end    

def warranty
  
  
end

def tech_support
  
  
end

def find_my_serial_number
  
end


def spare_parts
  
end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  
  def users_product_params
   params.require(:user).permit(:salutation_id, :first_name, :last_name, :email, :email2, 
   :job_title, :company, :address1, :address2, :city, :county, :post_code, :country_id,
   :phone, :phone2, :soundcraft_optin, :third_party_optin,
   :users_products_attributes => [:serial, :product_id, :purchased_date, :purchased_from, :purchased_amount,
     :comment, :application_id, :influence, :hear_from, :user_id])
  end
  
  def users_enquiry_params
   params.require(:user).permit(:salutation_id, :first_name, :last_name, :email, :email2, 
   :job_title, :company, :address1, :address2, :city, :county, :post_code, :country_id,
   :phone, :phone2, :soundcraft_optin, :third_party_optin,
   :users_enquiries_attributes => [:product_id, :enquiry_id, :subject, :message, :user_id])
  end
  
end

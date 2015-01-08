class ProductsController < ApplicationController
  before_filter :set_nav_and_footer_links
  
  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    @products = Product.where(slug: params[:id]).first || Product.find(params[:id])
  end

  def support_services
    #TBC launch
  end

  # PRODUCT CATEGORIES ########################
  
  def mixing_consoles
     @products = Product.all_with_prod_cat_id(1)
  end

  def stageboxes
    @products = Product.all_with_prod_cat_id(2)
  end
  
  def option_cards
    @products = Product.all_with_prod_cat_id(3)
  end
  
  def recording_interfaces
    @products = Product.all_with_prod_cat_id(4)
  end
  
  def plugins
    @products = Product.all_with_prod_cat_id(5)
  end
  
  def mobile_apps
    @products = Product.all_with_prod_cat_id(6)
  end
  
  def accessories
    @products = Product.all_with_prod_cat_id(7)
  end  
  
  
  # SUB CATEGORIES (PRODUCT SERIES)
  
  def vi_series
    @products = Product.all_with_prod_sub_cat_id(1)
  end
  
  def si_series
    @products = Product.all_with_prod_sub_cat_id(2)
  end  
  
  def gb_series
    @products = Product.all_with_prod_sub_cat_id(6)
  end
  
  def china_only
    @products = Product.all_with_prod_sub_cat_id(15)
  end  

  private
  

    # Never trust parameters from the scary internet, only allow the white list through.
    #def product_params
    #  params.require(:product).permit(:name, :description, :short_description, :image, :live, :hidden)
    #end
    
end

class ProductsController < ApplicationController
  before_filter :set_nav_and_footer_links
  helper :products
  
  # GET /products
  def index
    @products = Product.all.order(:position)
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
  
  
  
  # SUB CATEGORIES (PRODUCT SERIES)
  
  def product_series
    @products = Product.all_with_prod_sub_cat_id(params[:id])
  end
  

  private
  
  

    # Never trust parameters from the scary internet, only allow the white list through.
    #def product_params
    #  params.require(:product).permit(:name, :description, :short_description, :image, :live, :hidden)
    #end
    
end

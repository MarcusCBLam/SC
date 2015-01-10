Rails.application.routes.draw do
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

 # debugging help
  #get "/site_info" => 'main#site_info'
  
  get '/favicon.ico' => 'main#favicon'
  #get '/dashboard' => 'admin#index', as: :dashboard
  #get "/admin" => "admin#index", as: :admin_root, locale: I18n.default_locale
  
 
    
    # SDA Devise SECTION #########################################
    get '/sda' => 'sda#index', as: :sda_user_root
    devise_for :sda_users, 
         path: "sda",
      class_name: "SdaUser",
      controllers: {
        sessions: "sda/users/sessions",
        registrations: "sda/users/registrations",
        confirmations: "sda/users/confirmations",
        passwords: "sda/users/passwords",
        unlocks: "sda/users/unlocks"
      }
 
    as :sda_user do
      get '/sda/login' => 'sda/users/sessions#new', :as => :new_user_session
      post '/sda/login' => 'sda/users/sessions#create', :as => :user_session
      #delete '/sda/logout' => 'sda/users/sessions#destroy', :as => :destroy_user_session  
      get '/sda/logout' => 'sda/users/sessions#destroy', :as => :sda_logout
               
    end

  # main routing ##############################################
   root 'main#index'
  
 #namespace :admin do

  #    resources :news do
   #     member { put :notify }
    #  end
      
#end # namespace :admin
 
   # main ####################################################  
  resources :website_locales
  resources :websites
  resources :brands, only: [:index, :show]
  
    resources :news, only: [:index, :show] do
      collection { get :archived }
    end
    
  resources :users,
            :product_sub_categories,
            :product_categories
            
    # MICROSITES #############################################################
    
    get '/get-started/ui' => 'get_started#ui', as: :get_started_ui
    get '/get-started/signature' => 'get_started#signature', as: :get_started_signature
    get '/get-started' => 'get_started#index', as: :get_started
    
    
    # MENU PAGES #############################################################
    
    # media menu
    
    get "/media" => "media#index", as: :media
    get "/videos(/:id)" => "videos#index", as: :videos
    get "videos/play/:id" => "videos#play", as: :play_video
    get "/product-reviews(/:id)" => "product_reviews#index", as: :product_reviews
    get "/white-papers(/:id)" => "white_papers#index", as: :white_papers
    get "/downloads/images(/:id)" => "downloads#images", as: :images
    get "/social-media(/:id)" => "social_media#index", as: :social_media
    
    # what's on menu
    
    get "/whats-on" => "whats_on#index", as: :whats_on
    get "/mixing-with-professionals" => "mixing_with_professionals#index", as: :mixing_with_professionals
    get "/mixing-with-professionals/training-courses" => "mixing_with_professionals#training_courses", as: :training_courses
    get "/whats-on/events" => "whats_on#events", as: :events
    get "/whats-on/soundcraft-users"=> "whats_on#soundcraft_users", as: :soundcraft_users
    get "/whats-on/rental" => "whats_on#rental", as: :rental   
    
    # where-to-buy menu
    
    match '/where-to-buy(/:zip)' => 'where_to_buy#index', as: :where_to_buy , via: :all

    # support
    
    get "/support" => "support#index", as: :support
    get "/knowledgebase" => "knowledgebase#index", as: :knowledgebase
    match "/support/contact-us" => "support#contact_us", as: :contact_us, via: :all
    match "/support/product-registration" => "support#product_registration", as: :product_registration, via: :all
    get "/support/warranty" => "support#warranty", as: :warranty
    get "/support/tech-support" => "support#tech_support", as: :tech_support
    get "/support/spare-parts" => "support#spare_parts", as: :spare_parts
    get "/support/find-my-serial-number" => "support#find_my_serial_number", as: :find_my_serial_number  
    
    # footer links
    
    get "/about-harman" => "main#about_harman", as: :about_harman
    get "/about-soundcraft" => "main#about_soundcraft", as: :about_soundcraft
    get '/imprint' => 'main#imprint', as: :imprint
    get '/legal' => 'main#legal', as: :legal
    get '/privacy-policy' => 'main#privacy_policy', as: :privacy_policy
    #get '/sda' => 'sda#index', as: :sda 
    
    get '/mixing-with-professionals/mwp-calendar' => 'mixing_with_professionals#mwp_calendar', as: :mwp_calendar
    get '/guide-to-mixing' => 'guide_to_mixing#index', as: :guide_to_mixing
    get '/mailing-list' => 'main#mailing_list', as: :mailing_list
    
    match '/sitemap(.:format)' => 'main#sitemap', as: :sitemap, via: :all
    match '/search' => 'main#search', as: :search, via: :all
    get '/careers' => 'main#careers', as: :careers
    
    
    # PRODUCT MENUS ####################
    
    get '/products/mixing-consoles' => 'products#mixing_consoles', as: :mixing_consoles
    get '/products/stageboxes' => 'products#stageboxes', as: :stageboxes
    get '/products/option-cards' => 'products#option_cards', as: :option_cards
    get '/products/recording-interfaces' => 'products#recording_interfaces', as: :recording_interfaces
    get '/products/plugins' => 'products#plugins', as: :plugins
    get '/products/mobile-apps' => 'products#mobile_apps', as: :mobile_apps
    get '/products/accessories' => 'products#accessories', as: :accessories
    get '/support-services' => 'products#support_services', as: :support_services
    
    get '/products/mixing-consoles/vi-series' => 'products#vi_series', as: :vi_series
    get '/products/mixing-consoles/si-series' => 'products#si_series', as: :si_series
    get '/products/mixing-consoles/ui-series' => 'products#ui_series', as: :ui_series
    get '/products/mixing-consoles/signature-series' => 'products#signature_series', as: :signature_series
    get '/products/mixing-consoles/signature-mtk-series' => 'products#signature_mtk_series', as: :signature_mtk_series
    get '/products/mixing-consoles/gb-series' => 'products#gb_series', as: :gb_series
    get '/products/mixing-consoles/china' => 'products#china_only', as: :china_only
    #match above else use the default for products
    resources :products, only: [:index, :show] 
    
    
    # DEFAULT #################################################
     
    match '/' => 'main#index', as: :locale_root, via: :all
    
    match '/:controller(/:action(/:id))', via: :all
    match "*custom_route" => "pages#show", as: :custom_route, via: :all


end

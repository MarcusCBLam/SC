module NewsHelper

  # Using zurb foundation to show the product images
  #
  def interchange_news_thumbnail(news)
    q = []

    q << "[#{news.image.url(:email)}, (default)]"
    q << "[#{news.image.url(:large)}, (only screen and (min-width: 769px))]"
    q << "[#{news.image.url(:medium)}, (only screen and (max-width: 768px))]"

    image_tag(news.image.url(:email),
      data: { interchange: q.join(", ") })
  end  
  
  def check_s3
    
    p "TEST"
    
    #s3 = AWS::S3.new
    #s3.buckets.each do |bucket|
      #p bucket.name
    #end

  
  end
   
   
end

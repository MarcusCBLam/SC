class Knowledgebase < ActiveRecord::Base
  

 
 
   def self.search_keywords(search)
        
    search_length = search.split.length
    if search_length > 1
      where(live: 1).where([(['keywords LIKE ?'] * search_length).join(' AND ')] + search.split.map { |name| "%#{name}%" })
    else
      where("keywords LIKE ? AND live = ?", "%#{search}%", 1)
    end
    
  end 
end

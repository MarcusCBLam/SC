class PressRelease < ActiveRecord::Base
    belongs_to :PressReleaseType
    validates_presence_of :title
    validates_presence_of :description
    
end

class List < ApplicationRecord
 belongs_to :user
 validates :title, presence: true
 validates :description, presence: true
 validates :image, presence: true
 mount_uploader :image, ImageUploader

 def self.search(search)
  where("title iLIKE ? OR description iLIKE ?", "%#{search}%", "%#{search}%") 
 end

end

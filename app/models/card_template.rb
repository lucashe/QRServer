class CardTemplate < ActiveRecord::Base

  has_many :cards

  mount_uploader :frontImageURL, ImageUploader
  mount_uploader :backImageURL, ImageUploader

end

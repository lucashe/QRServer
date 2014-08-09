class Merchant < ActiveRecord::Base

  mount_uploader :logoURL, ImageUploader

end

class Card < ActiveRecord::Base
  belongs_to :card_template
  belongs_to :user

end

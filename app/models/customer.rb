class Customer < ActiveRecord::Base
  validates_uniqueness_of :id, :on => :create, :message => 'must be unique'
end

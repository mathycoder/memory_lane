class Recollection < ActiveRecord::Base
  belongs_to :user
  belongs_to :memory 
end

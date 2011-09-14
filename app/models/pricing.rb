class Pricing < ActiveRecord::Base
  belongs_to :product
  belongs_to :camp
end

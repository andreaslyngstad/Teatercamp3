class Pricing < ActiveRecord::Base
  belongs_to :product
  belongs_to :camp
  accepts_nested_attributes_for :product
end

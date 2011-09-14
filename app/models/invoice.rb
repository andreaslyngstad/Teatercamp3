class Invoice < ActiveRecord::Base
  belongs_to :registration
  has_one :credit_note
  
  def total_price
    registration.camp.products.sum(:total_price)
  end
end

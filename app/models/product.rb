class Product < ActiveRecord::Base
  has_many :pricings
  has_many :camps
  
  def eks_vat
    total_price/(1 + vat/100)
  end
  
  def vat_in_currency
    total_price - eks_vat
  end
end

class Invoice < ActiveRecord::Base
  belongs_to :registration
  has_one :credit_note
  has_many :products, through: :registration

  def total_price
    products.sum(:total_price)
  end
end

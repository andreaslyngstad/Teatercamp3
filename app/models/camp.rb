class Camp < ActiveRecord::Base
  has_many :registrations
  # validates :name, :description, :age1, :age2, :begin, :end, presence: true
  validates_presence_of :name, :description, :age1, :age2, :begin, :end
  validates_length_of :ingress, :maximum => 440, :allow_blank => true
  has_many :pricings
  has_many :products, :through => :pricings
   def total_eks_vat
     a = 0
     products.each do |p|
       a += p.eks_vat
     end
     a
   end
   def total_vat
     products.sum(:total_price) - total_eks_vat
   end
end

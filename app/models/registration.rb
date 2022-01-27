class Registration < ActiveRecord::Base
  has_one :invoice
  belongs_to :camp
  has_many :products, through: :camp
  validates_presence_of :name, :age, :parent_one_phone, :billing_email, :message => "Må fylles"
  validates_presence_of :parent_one_name, :if => :should_validate_parent_one_name?
  validates_format_of :billing_email, :with =>  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_format_of :parent_one_phone, :with => /(0047|\+47|47)?\d{8}/
  validates_length_of :parent_one_phone, :within => 8..8, :message => "skal ha 8 siffer"
  validate :camp_age

  def should_validate_parent_one_name?
    camp.age1 < 18
  end

  def camp_age
    unless (camp.age1..camp.age2) === (age)
      errors.add :age, "er ikke rett i forhold til kurset"
    end
  end
end

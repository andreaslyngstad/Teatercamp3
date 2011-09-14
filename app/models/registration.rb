class Registration < ActiveRecord::Base
  has_one :invoice
  belongs_to :camp
  validates_presence_of :name, :age, :parent_one_phone, :billing_email, :message => "Må fylles"
  validates_presence_of :parent_one_name, :if => :should_validate_parent_one_name?
  validates_format_of :billing_email, :with => /^(\S+)@(\S+)\.(\S+)$/
  validates_format_of :parent_one_phone, :with => /^[0-9]+$/
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

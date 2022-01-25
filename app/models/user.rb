class User < ActiveRecord::Base




  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  before_save :encrypt_password
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login

  validates_length_of       :first_name,     :maximum => 100


  validates_length_of       :last_name,     :maximum => 100
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email

  has_many  :posts, :foreign_key => "author_id"
  # has_many  :recent_posts, :class_name => 'Post',
  #           :limit => 5

  def full_name
    self.first_name + " " + self.last_name
  end

  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



end

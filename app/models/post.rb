class Post < ActiveRecord::Base


  # scope :eager_post, -> include  [:author, :categories],
  # :order => "created_at DESC", :conditions => "status = 'Offentlig'"

  belongs_to :author, :class_name => "User",
                      :foreign_key => "author_id"
  # has_many :comments, :order => "created_at ASC",
  #                     :dependent => :destroy
  # has_many :approved_comments, :class_name => "Comment",
  #          :conditions => "status = 'godkjent' OR status = 'nye'"
  has_many :categorizations
  has_many :categories, :through => :categorizations
  # validates_presence_of :title

  def self.search(search)
    if search
      find(:all, :include => [:author, :approved_comments],
      :order => "posts.created_at DESC",
      :conditions => ['title LIKE ? OR content LIKE ? OR lead LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])

    else
      @posts = Post.where(status: 'Offentlig').order("posts.created_at DESC")
    end
  end
  def self.eager_post
    order("created_at DESC").where("status = 'Offentlig'")
  end

end

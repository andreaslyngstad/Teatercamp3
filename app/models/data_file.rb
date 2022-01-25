class DataFile < ActiveRecord::Base
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :photo, :message => "Du glemte å laste opp bildet"


end

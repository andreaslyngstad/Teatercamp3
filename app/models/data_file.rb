class DataFile < ActiveRecord::Base
  has_attached_file :photo

  # validates_attachment_presence :photo, :message => "Du glemte å laste opp bildet"


end

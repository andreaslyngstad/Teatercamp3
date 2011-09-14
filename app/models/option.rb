class Option < ActiveRecord::Base
 
  has_attached_file :blogg_photo, :styles => { :small => "200x150#" }
  has_attached_file :camp_photo, :styles => { :small => "200x150#" }
   validates_attachment_presence :camp_photo, :message => "Du glemte å laste opp :camp_photo"
   validates_attachment_presence :blogg_photo, :message => "Du glemte å laste opp :blogg_photo"
end

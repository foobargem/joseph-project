class Feed < ActiveRecord::Base

  has_many :comments, :class_name => "Feed", :foreign_key => :parent_id

end

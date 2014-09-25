class Comment < ActiveRecord::Base
  attr_accessible :release_id, :checklist_item_id, :checklist_item_type, :comment, :author, :modified_by
  
  belongs_to :checklist_item
end
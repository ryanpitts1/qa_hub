class ReleaseData < ActiveRecord::Base
  attr_accessible :section, :label, :priority
  
  has_many :checklist_tools
  has_many :checklist_items
end
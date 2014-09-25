class ChecklistTool < ActiveRecord::Base
  attr_accessible :release_id, :release_data_id, :value, :modified_by
  
  belongs_to :release, touch: true
  belongs_to :release_data
end
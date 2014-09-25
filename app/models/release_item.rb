class ReleaseItem < ActiveRecord::Base
  attr_accessible :release_id, :item_type, :source, :source_reference, :title, :is_config_change, :is_data_change, :affected_product, :level_of_comfort, :level_of_risk, :comments, :modified_by
  
  belongs_to :release, touch: true
  
  validates_presence_of :title, :item_type, :source, :affected_product, :level_of_comfort, :level_of_risk, :comments, :modified_by
  validates_inclusion_of :is_data_change, :is_config_change, in: [true, false]
  validates_length_of :title, maximum: 500
  validates_length_of :comments, maximum: 1000
end
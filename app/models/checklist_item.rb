class ChecklistItem < ActiveRecord::Base
  attr_accessible :release_id, :release_data_id, :environment, :value, :applicable, :modified_by
  
  belongs_to :release, touch: true
  belongs_to :release_data
  has_many :comments, dependent: :destroy
end
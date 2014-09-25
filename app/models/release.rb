class Release < ActiveRecord::Base
  attr_accessible :title, :contact, :backup_contact, :release_date, :code_cutoff_date, :modified_by, :archive
  
  has_many :checklist_items, dependent: :destroy
  has_many :checklist_tools, dependent: :destroy
  has_many :release_items, dependent: :destroy
  
  validates_presence_of :title, :release_date, :code_cutoff_date, :modified_by
  validates_length_of :title, maximum: 60
end
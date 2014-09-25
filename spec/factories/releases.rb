FactoryGirl.define do
  factory :release do |r|
    r.sequence(:title) { |n| "Song Title #{n}" }
    contact "Example User 1"
    backup_contact "Example User 2"
    release_date "2013-01-07"
    code_cutoff_date "2013-01-01"
    modified_by "exampleuser@example.com"
    
    @checklist_tools = ReleaseData.find(:all, conditions: "section LIKE 'tools'", order: "priority ASC")
	@checklist_tools.each do |t|
	  @tool = ChecklistTool.new(release: release, release_data_id: t.id, value: false)
	  @tool.save
	end
      
    @checklist_items = ReleaseData.find(:all, conditions: "section NOT LIKE 'tools'", order: "section ASC, priority ASC")
    @checklist_items.each do |i|
      @item = ChecklistItem.new(release: release, release_data_id: i.id, environment: i.section, value: false, applicable: true)
      @item.save
    end  
    
    factory :release_with_release_items do
      ignore do
        release_items_count 40
      end
      
      after(:create) do |release, evaluator|
        FactoryGirl.create_list(:release_item, evaluator.release_items_count, release: release)
      end
    end
  end
  
  factory :release_item do |ri|
    release
    
    type "General"
    source "VersionOne"
    source_reference "D-11111"
    ri.sequence(:title) { |n| "Arrangement #{n}" }
    is_config_change 0
    is_data_change 0
    affected_browsers "FireFox, Chrome"
    affected_designs "DealerElite, DealerExtreme"
    affected_product "Fusion Website"
    level_of_comfort 3
    level_of_risk 1
    comments "example user: this item has been checked in dev"
    modified_by "exampleuser@example.com"
  end
end
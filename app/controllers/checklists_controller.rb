class ChecklistsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  
  def show
    @release = Release.find(params[:id])
    @checklist_tools = ChecklistTool.find(:all, joins: :release_data, conditions: ["checklist_tools.release_id = ?", params[:id]], order: "checklist_tools.release_data_id ASC")
    @checklist_development_items = ChecklistItem.find(:all, select: "checklist_items.*, users.id as uid, users.email, users.name", joins: [:release_data, "LEFT JOIN comments ON comments.checklist_item_id = checklist_items.id", "LEFT JOIN users ON users.email = checklist_items.modified_by"], conditions: ["checklist_items.release_id = ? AND release_data.section = ?", params[:id], "development"], group: "checklist_items.id, uid", order: "checklist_items.id ASC")
    @checklist_stage_items = ChecklistItem.find(:all, select: "checklist_items.*, users.id as uid, users.email, users.name", joins: [:release_data, "LEFT JOIN comments ON comments.checklist_item_id = checklist_items.id", "LEFT JOIN users ON users.email = checklist_items.modified_by"], conditions: ["checklist_items.release_id = ? AND release_data.section = ?", params[:id], "stage"], group: "checklist_items.id, uid", order: "checklist_items.id ASC")
    @checklist_production_items = ChecklistItem.find(:all, select: "checklist_items.*, users.id as uid, users.email, users.name", joins: [:release_data, "LEFT JOIN comments ON comments.checklist_item_id = checklist_items.id", "LEFT JOIN users ON users.email = checklist_items.modified_by"], conditions: ["checklist_items.release_id = ? AND release_data.section = ?", params[:id], "production"], group: "checklist_items.id, uid", order: "checklist_items.id ASC")
    @projects = ReleaseItem.find(:all, select: "release_items.*, users.email, users.name", joins: "LEFT JOIN users ON users.email = release_items.modified_by", conditions: ["release_items.item_type = ? AND release_items.release_id = ?", 'Project', params[:id]])
    @project_comments = Comment.find(:all, conditions: ["release_id = ? AND checklist_item_type = ?", params[:id], 'Project'])
  end
  
  def toggle_tool
    @tool = ChecklistTool.find(params[:id])
    @tool.toggle!(:value)
    @tool.update_column(:modified_by, current_user.email)
    respond_to do |format|
      format.js
	  end
  end
  
  def toggle_item
    @item = ChecklistItem.find(params[:id])
    @item.toggle!(:value)
    @item.update_column(:modified_by, current_user.email)
    render nothing: true
  end
  
  def toggle_applicable
    @item = ChecklistItem.find(params[:id])
    @item.toggle!(:applicable)
    @item.update_column(:modified_by, current_user.email)
    respond_to do |format|
      format.js
	  end
  end
  
  def destroy
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist_item.destroy
  end
end
class ReleaseItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
  def index
    @release = Release.find(params[:id])
    @release_items = ReleaseItem.find(:all, select: "release_items.*, users.email, users.name", joins: "LEFT JOIN users ON users.email = release_items.modified_by", conditions: ["release_items.release_id = ?", params[:id]], order: "release_items.id ASC")
    @release_items_levels_averages = ReleaseItem.find(:all, select: "ROUND(AVG(level_of_risk)) AS risk_level_average, ROUND(AVG(level_of_comfort)) AS comfort_level_average", conditions: ["release_id = ?", params[:id]]).first
    @items_data, @items_general, @items_patch, @items_project, @items_upgrade = [], [], [], [], []
    @release_items.each do |item|
      @items_data << item if item.item_type == 'Data'
      @items_general << item if item.item_type == 'General'
      @items_patch << item if item.item_type == 'Patch'
      @items_project << item if item.item_type == 'Project'
      @items_upgrade << item if item.item_type == 'Upgrade'
    end
  end
  
  def new
    @release_item = ReleaseItem.new
    @affected_browsers_data = AffectedBrowsersData.find(:all, conditions: ["active = ?", true], order: "priority ASC")
    @affected_designs_data = AffectedDesignsData.find(:all, conditions: ["active = ?", true], order: "category ASC, label ASC")
    @designs_acura, @designs_chevrolet, @designs_general, @designs_gsm, @designs_ford, @designs_mazda, @designs_scion, @designs_tools = [], [], [], [], [], [], [], []
    @affected_designs_data.each do |design|
      @designs_acura << design if design.category == 'Acura'
      @designs_chevrolet << design if design.category == 'Chevrolet'
      @designs_general << design if design.category == 'General'
      @designs_gsm << design if design.category == 'GSM'
      @designs_ford << design if design.category == 'Ford'
      @designs_mazda << design if design.category == 'Mazda'
      @designs_scion << design if design.category == 'Scion'
      @designs_tools << design if design.category == 'Tools'
    end
  end
  
  def create
    @release_item = ReleaseItem.new(params[:release_item])
    affected_browsers = params[:affected_browsers]
    affected_designs = params[:affected_designs]
    if affected_browsers
	    @release_item.affected_browsers = affected_browsers.join(", ")
	  end
	  if affected_designs
      @release_item.affected_designs = affected_designs.join(", ")
    end
    if @release_item.save
      flash[:success] = "\"#{@release_item.title}\" has been created as a new release item."
      redirect_to release_items_path(id: @release_item.release_id)
    else
      @affected_browsers_data = AffectedBrowsersData.find(:all, conditions: ["active = ?", true], order: "label ASC")
      @affected_designs_data = AffectedDesignsData.find(:all, conditions: ["active = ?", true], order: "label ASC")
      render 'new'
    end
  end
  
  def edit
    @release_item = ReleaseItem.find(params[:id])
    @affected_browsers_data = AffectedBrowsersData.find(:all, conditions: ["active = ?", true], order: "priority ASC")
    @affected_designs_data = AffectedDesignsData.find(:all, conditions: ["active = ?", true], order: "category ASC, label ASC")
    @designs_acura, @designs_asbury, @designs_bmw, @designs_dealer, @designs_facebook, @designs_ford, @designs_gsm, @designs_infiniti, @designs_lincoln, @designs_mobile, @designs_nissan, @designs_scion, @designs_tools, @designs_general = [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
    @affected_designs_data.each do |design|
      @designs_acura << design if design.category == 'Acura'
      @designs_asbury << design if design.category == 'Asbury'
      @designs_bmw << design if design.category == 'BMW'
      @designs_dealer << design if design.category == 'Dealer'
      @designs_facebook << design if design.category == 'Facebook'
      @designs_ford << design if design.category == 'Ford'
      @designs_gsm << design if design.category == 'GSM'
      @designs_infiniti << design if design.category == 'Infiniti'
      @designs_lincoln << design if design.category == 'Lincoln'
      @designs_mobile << design if design.category == 'Mobile'
      @designs_nissan << design if design.category == 'Nissan'
      @designs_scion << design if design.category == 'Scion'
      @designs_tools << design if design.category == 'Tools'
      @designs_general << design if design.category == 'General'
    end
  end
  
  def update
    @release_item = ReleaseItem.find(params[:id])
    affected_browsers = params[:affected_browsers]
    affected_designs = params[:affected_designs]
    if affected_browsers
	    @release_item.affected_browsers = affected_browsers.join(", ")
	  end
	  if affected_designs
      @release_item.affected_designs = affected_designs.join(", ")
    end
    if @release_item.update_attributes(params[:release_item])
      redirect_to release_items_path(id: @release_item.release_id), :notice  => "\"#{@release_item.title}\" has been updated!"
    else
      @affected_browsers_data = AffectedBrowsersData.find(:all, conditions: ["active = ?", true], order: "label ASC")
      @affected_designs_data = AffectedDesignsData.find(:all, conditions: ["active = ?", true], order: "label ASC")
      render 'edit'
    end
  end
  
  def destroy
    @release_item = ReleaseItem.find(params[:id])
    @release_item.destroy
    flash[:success] = "\"#{@release_item.title}\" has been deleted."
    redirect_to :back
  end
end
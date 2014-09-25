class ReleasesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
  def index
    @archive = params[:archive]
    if @archive == 'true'
      @archive_status = 'true'
      @releases = Release.paginate(page: params[:page], :per_page => 10, :order => "release_date DESC, title ASC")
    else
      @archive_status = 'false'
      @releases = Release.paginate(page: params[:page], :per_page => 10, :conditions => ["archive = ?", false], :order => "release_date DESC, title ASC")
    end
  end
  
  def new
    @release = Release.new
    @users = User.find(:all, select: "id, name", order: "name ASC").collect
  end
  
  def create
    @release = Release.new(params[:release])
    if @release.save
      @checklist_tools = ReleaseData.find(:all, conditions: "section LIKE 'tools'", order: "priority ASC")
      @checklist_tools.each do |t|
        @tool = ChecklistTool.new(release_id: @release.id, release_data_id: t.id, value: false)
        @tool.save
      end
      @checklist_items = ReleaseData.find(:all, conditions: "section NOT LIKE 'tools'", order: "section ASC, priority ASC")
      @checklist_items.each do |i|
        @item = ChecklistItem.new(release_id: @release.id, release_data_id: i.id, environment: i.section, value: false, applicable: true)
        @item.save
      end
      flash[:success] = "\"#{@release.title}\" has been created as a new release."
      redirect_to releases_path
    else
      @users = User.find(:all, select: "id, name", order: "name ASC").collect
      render 'new'
    end
  end
  
  def edit
    @release = Release.find(params[:id])
    @users = User.find(:all, select: "id, name", order: "name ASC").collect
  end
  
  def update
    @release = Release.find(params[:id])
    if @release.update_attributes(params[:release])
      if @release.archive == true
        flash[:warning] = "\"#{@release.title}\" has been updated and archived."
      else
        flash[:success] = "\"#{@release.title}\" has been updated."
      end
      redirect_to releases_path
    else
      @users = User.find(:all, select: "id, name", order: "name ASC").collect
      render 'edit'
    end
  end
  
  def destroy
    @release = Release.find(params[:id])
    @release.destroy
    flash[:success] = "\"#{@release.title}\" has been deleted."
    redirect_to releases_path
  end
end
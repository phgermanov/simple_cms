class SectionsController < ApplicationController

  layout 'admin'
  
  before_action :confirm_logged_in
  before_action :find_pages, :only => [:new, :create, :edit, :update]
  before_action :set_section_count, :only => [:new, :create, :edit, :update]
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
    @page = Page.find(@section.page_id)
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(sections_path)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully"
    redirect_to(section_path(@section))
  end

  private

  def find_pages
    @pages = Page.all
  end

  def set_section_count
    @section_count = Section.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end

  def section_params
    params.require(:section).permit(:name, :position, :page_id, :content_type, :content, :visible)
  end
end

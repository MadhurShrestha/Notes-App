class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist, only: [:show, :edit, :update, :destroy ]



  # GET /checklists or /checklists.json
  def index
    @checklists = Checklist.all
  end

  # GET /checklists/1 or /checklists/1.json
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists or /checklists.json
  def create
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    checklist = page.checklists.create
    redirect_to notebook_page_path(notebook,page)
  end

  # PATCH/PUT /checklists/1 or /checklists/1.json
  def update
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    checklist = page.checklists.find(params[:id])
    checklist.update(checklist_params)
    redirect_to notebook_page_path(notebook, page)
  end

  # DELETE /checklists/1 or /checklists/1.json
  def destroy
    @checklist.destroy
      redirect_to checklists_url, notice: "Checklist was successfully destroyed."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_params
      params.require(:checklist).permit(:title)
    end
end

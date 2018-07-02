class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /Lists
  # GET /Lists.json
  def index
    @Lists = List.all
      if params[:search]
        @Lists = List.search(params[:search]).order("created_at DESC")
      else
        @Lists = List.all.order("created_at DESC")
      end
  end

  # GET /Lists/1
  # GET /Lists/1.json
  def show

  end

  # GET /Lists/new
  def new
    @List = List.new
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # GET /Lists/1/edit
  def edit
    @List = List.find(params[:id])
  end

  # POST /Lists
  # POST /Lists.json
  def create
    @List = List.new(List_params)
    respond_to do |format|
      if @List.save(validate: false)
        format.html { redirect_to @List, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @List }
      else
        format.html { render :new }
        format.json { render json: @List.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Lists/1
  # PATCH/PUT /Lists/1.json
  def update
    @List.update_attributes!(List_params)
    respond_to do |format|
      if @List.update(List_params)
        format.html { redirect_to @List, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @List }
      else
        format.html { render :edit }
        format.json { render json: @List.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Lists/1
  # DELETE /Lists/1.json
  def destroy
    @List.destroy
    respond_to do |format|
      format.html { redirect_to Lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_List
      @List = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def List_params
      params.require(:List).permit(:title, :description, :image)
    end
end

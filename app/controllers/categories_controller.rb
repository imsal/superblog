class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  before_action :author_must_be_signed_in_to_access

  # GET /categories
  def index
    @main_categories = Category.main_categories.order(:id)#Category.order(:id)
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update

    if @category.update(category_params)
      redirect_to edit_category_path(@category), notice: "#{@category.name} has been updated."
    else
      render :edit
    end

  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy

    redirect_to categories_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by_slug(params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :slug, :parent_id)
    end


end

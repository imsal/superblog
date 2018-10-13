class AuthorsController < ApplicationController
  before_action :author_must_be_signed_in_to_access, except: [:show]
  before_action :set_author, only: [:show, :edit, :update, :destroy]


  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/1
  def show
    @posts = Post.where(author_id: @author.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15)
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:name, :email_address, :bio, :password, :password_confirmation, :authorization_token, :authorized, :profile_image)
    end
end

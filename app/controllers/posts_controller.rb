class PostsController < ApplicationController

  before_action :author_must_be_signed_in_to_access

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(id: :desc)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path

    else
      render :new
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

      if @post.update(post_params)
        redirect_back fallback_location: posts_url
      else
        render :edit
      end

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_slug(params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :active, :activation_date, :slug, :tag_list, :main_image, :summary, :author_id, images: [])
    end
end

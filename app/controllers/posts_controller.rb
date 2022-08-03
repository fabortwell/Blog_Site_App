class PostsController < ApplicationController
    # GET /posts
  def index
    posts = Post.all
    render json: posts
  end

  # POST /posts
  def create
    post = Post.create(post_params)
    render json: post, status: :created
  end

  # GET /posts/:id
  def show
    post = Post.find_by(id: params[:id])
    if post
      render json: post
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  # PATCH /posts/:id
  def update
    post = Post.find_by(id: params[:id])
    if post
      post.update(post_params)
      render json: post
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post
      post.destroy
      head :no_content
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  # PATCH /posts/:id/like
  def increment_ratings
    post = Post.find_by(id: params[:id])
    if post
      post.update(likes: post.ratings + 1)
      render json: post
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  private

  def post_params
    params.permit(:id, :author, :title, :content, :category, :image_url)
  end
end

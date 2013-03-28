class PostsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show, :chinese]

  def index
    if signed_in?
      @posts = Post.where("lang = ?", params[:l]).paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.where("public = ? AND lang = ?", true, params[:l]).paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @post = Post.find(params[:id]) || not_found
    if !@post.public && !signed_in?
      not_found
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to root_url
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url
  end
end

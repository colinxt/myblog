class PostsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      if signed_in?
        @posts = Post.paginate(page: params[:page], per_page: 5)
      else
        @posts = Post.where("public = ?", true).paginate(page: params[:page], per_page: 5)
      end
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
    @tags = @post.tags.build
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = @post.tags
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

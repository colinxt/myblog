class TagsController < ApplicationController
  def show
    @posts = Post.tagged_with(params[:id])
    if signed_in?
      @posts = @posts.paginate(page: params[:page], per_page: 5)
    else
      @posts = @posts.where("public = ?", true).paginate(page: params[:page], per_page: 5)
    end
  end
end

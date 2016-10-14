class PostsController < ApplicationController

  before_action :set_model, only: [:show]
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
  end

    def create
      @post = Post.new(permit_post)
        if @post.save 
          flash[:success] = "Success!"
          redirect_to post_path(@post)
          else
            flash[:error] = @post.errors.full_messages
            rendirect_to new_post_path
          end
    end


 private

    def set_model
      @post = Post.find(params[:id])
    end

    def permit_post
        params.require(:post).permit(:image, :description)
    end
end
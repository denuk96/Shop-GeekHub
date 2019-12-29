class CommentsController < ApplicationController
  before_action :set_product

  def index
    @product.comments = @product.comments.arrange(order: :created_at)
  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @product, notice: 'Comment leaved'
    else
      redirect_to @product, alert: @comment.errors.full_messages.first
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :rating, :user_id, :product_id)
  end
end

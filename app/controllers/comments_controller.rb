class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: :destroy
  before_action :admin_verify, only: :destroy
  before_action :comment_already_exist?, only: :create

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
      redirect_to @product, notice: 'Thank you for your opinion. You are important for us!'
    else
      redirect_to @product, alert: @comment.errors.full_messages.first
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @product, notice: 'Destroyed'
    else
      redirect_to @product, alert: 'Smth went wrong..'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def admin_verify
    redirect_to home_path, alert: 'You have no rights' unless current_user&.admin?
  end

  def comment_already_exist?
    if Comment.where(user_id: current_user.id, product_id: params[:product_id]).exists?
      redirect_to @product, alert: 'You have already commented'
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :rating, :product_id)
  end
end

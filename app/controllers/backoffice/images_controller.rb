class Backoffice::ImagesController < Backoffice::BackofficeController
  before_action :set_product

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = t('controllers.images.deleting_failed') unless @product.save
    redirect_to edit_admin_product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def remove_image_at_index(index)
    remain_images = @product.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @product.images = remain_images # re-assign back
  end
end

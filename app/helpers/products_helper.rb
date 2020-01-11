module ProductsHelper
  def count_average_rating(product)
    comments = product.comments
    total = comments&.sum(:rating)
    @average_rating = total.to_f / comments&.count
  end
end

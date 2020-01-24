module ProductsHelper
  def count_average_rating(product)
    comments = product.comments
    total = comments&.sum(:rating)
    @average_rating = total.to_f / comments&.count
  end

  def render_stars(value)
    output = ''
    value.floor.times { output += '<i class="fas fa-star"></i>' } if (1..5).include?(value.floor)
    if value == (value.floor + 0.5) && value.to_i != 5
      output += '<i class="fas fa-star-half-alt"></i>'
      @digit = 1
    else
      @digit = 0
    end
    empty_star = ((5 - @digit) - value.floor)
    empty_star.times do
      output += '<i class="fas fa-star empty-star"></i>'
    end
    output.html_safe
  end
end

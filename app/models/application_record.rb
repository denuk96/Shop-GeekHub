class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #def self.search(search)
  #  where('title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  #end

  def self.search(search)
    where('title ILIKE ? OR description ILIKE ? OR cast(category_id as text) ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

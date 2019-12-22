class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search)
    where('title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")
  end
end

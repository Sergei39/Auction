class Product < ApplicationRecord
  validates :price, numericality: true, presence: true
  validates :title, presence: true

  def userr
    User.find(self.user)
  end
end

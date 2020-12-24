class Product < ApplicationRecord
  def userr
    User.find(self.user)
  end
end

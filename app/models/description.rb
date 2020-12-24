class Description < ApplicationRecord
  def title
    unless self.product.nil?
      Product.find(self.product).title
    end
  end

  def buyer
    User.find(self.buyer_id) unless self.buyer_id.nil?
  end

  def prod
    unless self.product.nil?
      Product.find(self.product)
    end
  end
end

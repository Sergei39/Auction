class Review < ApplicationRecord
  def reviewer
    unless self.reviewer_id.nil?
      User.find(self.reviewer_id)
    end
  end
end

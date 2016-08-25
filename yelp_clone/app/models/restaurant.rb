class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  def build_review(review_params, current_user)
    review=reviews.build(review_params)
    review.user = current_user
    return review
  end
end

class Restaurant < ActiveRecord::Base
  has_many :reviews do
    def build_with_user(attributes = {}, user)
      attributes[:user] ||=user
      build(attributes)
    end
  end
  validates :name, length: { minimum: 3 }, uniqueness: true


end

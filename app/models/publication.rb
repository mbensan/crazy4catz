class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
end

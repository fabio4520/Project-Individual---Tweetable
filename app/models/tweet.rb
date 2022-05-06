class Tweet < ApplicationRecord
  belongs_to :user
  # Validations
  validates :body, presence: true, length: { maximum: 140 }
  # Associations
  has_many :comments, dependent: :destroy
end

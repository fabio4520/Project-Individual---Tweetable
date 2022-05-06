class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :comments_count
  # Asocciations
  validates :body, presence: true, length: { maximum: 140 }
end

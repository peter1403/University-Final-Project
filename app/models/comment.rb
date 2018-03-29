class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :content
  validates :user_id, presence: true
  validates :content_id, presence: true
  validates :content_text, presence: true, length: {maximum: 100}
end

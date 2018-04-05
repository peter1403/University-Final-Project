class Content < ApplicationRecord
  belongs_to :user
  acts_as_votable
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true
  mount_uploader :picture, PictureUploader

  def next
    id = @content.id + 1
    Content.find(id)
  end

  def prev
    contents.where("id > ?", id).last
  end

end

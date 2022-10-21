class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, :image, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :concept, presence: true, length: { maximum: 300 }
  validates :image, presence: true
end

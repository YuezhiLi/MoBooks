class Book < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  mount_uploader :cover, CoverUploader
  validates :title, presence: true
  validates :cover, presence: true
  validates :description, presence: true, length: { minimum: 30 }
end

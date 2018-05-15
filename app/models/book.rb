class Book < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  mount_uploader :cover, CoverUploader
end

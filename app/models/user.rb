class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :events
  has_many :reviews
  has_many :borrowed_books, through: :events, source: :book
end

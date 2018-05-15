class User < ApplicationRecord
  has_many :books
  has_many :events
  has_many :borrowed_books, through: :events, source: :book
end

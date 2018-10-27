class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }

  belongs_to :user
  belongs_to :blog
end
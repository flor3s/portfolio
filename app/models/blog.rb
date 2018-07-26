class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  paginates_per 5

  validates_presence_of :title, :body

  belongs_to :topic
end

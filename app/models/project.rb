class Project < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

  scope :angular, -> { where(subtitle: 'Angular') }
	scope :ruby_on_rails_projects, -> { where(subtitle: 'Ruby on Rails') }
end

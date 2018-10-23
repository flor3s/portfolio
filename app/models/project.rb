class Project < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, 
																reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :title, :body

  mount_uploader :main_image, ProjectUploader
  mount_uploader :thumb_image, ProjectUploader


# create custom scopes two different ways
	def self.angular
		where(subtitle: 'Angular')
	end

  def self.by_position
    order("position ASC")
  end

	scope :ruby_on_rails_projects, -> { where(subtitle: 'Ruby on Rails') }
end
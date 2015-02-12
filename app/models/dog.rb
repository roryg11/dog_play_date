class Dog < ActiveRecord::Base
  belongs_to :user
  validates :name, :breed, :gender, presence: true

  has_attached_file :image, :default_url => "/images/normal/missingdog.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

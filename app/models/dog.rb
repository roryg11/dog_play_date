class Dog < ActiveRecord::Base
  belongs_to :user
  validates :name, :age, :gender, :size, :play, presence: true

  has_attached_file :image, :default_url => "/images/normal/missingdog.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

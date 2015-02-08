class User < ActiveRecord::Base
  validates :name, :email, :zipcode,  presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 }
  validates :name, length: { minimum: 2 }

  has_many :dogs
  has_secure_password

  has_attached_file :avatar, :default_url => "/images/normal/missinguser.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :conversations, :foreign_key => :sender_id
end

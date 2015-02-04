class User < ActiveRecord::Base
  has_many :dogs
  has_secure_password

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :conversations, :foreign_key => :sender_id
end

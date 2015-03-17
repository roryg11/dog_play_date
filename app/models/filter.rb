class Filter < ActiveRecord::Base
  belongs_to :user
  self.inheritance_column = :type
  
  def self.types
    %w(Breed Size Age Personality Play BlockedUser Gender Location)
  end

  def filter(_)
    raise 'Abstract Method'
  end

  scope :ages, -> {where(type: 'Age')}
  scope :breeds, -> {where(type: 'Breed')}
  scope :sizes, -> {where(type: 'Size')}
  scope :personalities, -> {where(type: 'Personality')}
  scope :plays, -> {where(type: 'Play')}
  scope :blocked_user_ids, -> {where(type: 'BlockedUser')}
  scope :gender, -> {where(type: 'Gender')}
  scope :location, -> {where(type: 'Location')}
end

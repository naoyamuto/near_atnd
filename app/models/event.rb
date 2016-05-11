class Event < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: {maximum: 50}
  validates :hold_at, presence: true
  validates :capacity, presence: true
  validates :location, presence: true, length: {maximum: 100}
  validates :owner, presence: true
  validates :description, presence: true, length: {maximum: 2000}

end

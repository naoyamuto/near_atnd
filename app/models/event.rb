class Event < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: {maximum: 40}
  validates :hold_at, presence: true

end

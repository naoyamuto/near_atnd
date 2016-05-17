class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 50}
  validates :hold_at, presence: true
  validates :capacity, presence: true
  validates :location, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates :owner, presence: true
  validates :description, presence: true, length: { maximum: 2000}

  # イベントを作成したユーザーだったらtrueを返す
  def created_by?(user)
    return false unless user
    user_id = user.id
  end

end

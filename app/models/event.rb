class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :hold_at, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :location, presence: true
  validates :owner, presence: true
  validates :description, presence: true, length: { maximum: 2000 }

  # イベントを作成したユーザーだったらtrueを返す
  def created_by?(user)
    if user
       return user_id == user.id
    end
  end
end

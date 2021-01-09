class Fact < ApplicationRecord
  validates :fact, presence: true
  validates :likes, presence: true
  validates :user_id, presence: true
  validates_presence_of :user
  belongs_to :user
end

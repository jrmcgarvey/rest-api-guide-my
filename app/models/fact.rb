class Fact < ApplicationRecord
  validates :fact, presence: true
  validates :likes, presence: true
  validates :customer_id, presence: true
  validates_presence_of :customer
  belongs_to :user
end

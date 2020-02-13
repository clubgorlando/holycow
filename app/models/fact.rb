class Fact < ApplicationRecord
  validates :message, presence: true
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  belongs_to :user
end

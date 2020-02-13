class Fact < ApplicationRecord
  validates :message, presence: true
  has_many :likes, dependent: :destroy
  has_many :cowpies, dependent: :destroy
  belongs_to :user
end

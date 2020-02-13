class Dislike < ApplicationRecord
  belongs_to :fact
  belongs_to :user
end

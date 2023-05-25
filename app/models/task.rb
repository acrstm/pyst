class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :group, presence: true
end

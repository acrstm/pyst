class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :group, presence: true
  default_scope -> { order('created_at DESC') }
  scope :completed, -> { where(completed: true) }
  scope :incomplete,-> { where(completed: false) }
end

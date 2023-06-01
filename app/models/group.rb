class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tasks
  has_one_attached :photo
end

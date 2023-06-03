class Group < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tasks
  # has_many :roomies, :class_name => "User"
  has_one_attached :photo
end

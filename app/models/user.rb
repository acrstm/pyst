class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, through: :groups
  has_many :fixed_costs, through: :groups
  belongs_to :group
  has_one_attached :photo
  # has_many :properties, :class_name => "Group", :foreign_key => "owner_id"  # This is the dwellings the user owns
end

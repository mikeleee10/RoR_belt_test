class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user
  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
end

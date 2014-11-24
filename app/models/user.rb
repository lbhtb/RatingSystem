class User < ActiveRecord::Base
  has_many :equipments,dependent: :destroy
  validates :name , presence: true
  validates :name, uniqueness: true
end

class Home < ApplicationRecord
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to :user
end

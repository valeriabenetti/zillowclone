class Home < ApplicationRecord
  include ImageUploader[:image]

  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to :user
end

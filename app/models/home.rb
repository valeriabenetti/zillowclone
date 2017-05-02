class Home < ApplicationRecord
  include ImageUploader[:image]

  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :favorites

  def self.search(search)
    where("address like ? or  city like ? or state like ? or zipcode = ?", "%#{search}%", "%#{search}%", "%#{search}%", @search.to_i)
  end

  def square_meters
    square_feet * 0.0929
  end
end

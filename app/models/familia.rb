class Familia < ApplicationRecord
  belongs_to :cel

  validates :nombre, uniqueness: true
end

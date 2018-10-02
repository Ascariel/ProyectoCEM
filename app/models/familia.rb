class Familia < ApplicationRecord
  belongs_to :cel, optional: true

  validates :nombre, uniqueness: true
end

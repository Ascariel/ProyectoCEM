class Alumno < ApplicationRecord
  validates :codigo_alumno, uniqueness: true
  validates :nombre, :codigo_alumno, presence: true
end

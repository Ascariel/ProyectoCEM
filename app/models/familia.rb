class Familia < ApplicationRecord
  belongs_to :cel, optional: true
  belongs_to :pais

  validates :nombre, uniqueness: true

  enum estado_postulacion_cel: { libre: 0, pediente: 1, aprobada: 2 }
end

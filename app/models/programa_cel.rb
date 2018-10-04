class ProgramaCel < ApplicationRecord
  belongs_to :cel
  belongs_to :programa_estudio

  validates :programa_estudio_id, uniqueness: { scope: :cel_id }

  enum estado: { pendiente: 0, aprobado: 1 }
end

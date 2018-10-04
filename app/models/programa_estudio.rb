class ProgramaEstudio < ApplicationRecord
  belongs_to :pais
  has_many :programa_cursos
  has_many :programa_cels

  enum duracion: { normal: 0, corto: 1 }
end

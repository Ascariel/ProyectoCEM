class ProgramaEstudio < ApplicationRecord
  belongs_to :pais
  enum duracion: { normal: 0, corto: 1 }

end

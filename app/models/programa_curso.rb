class ProgramaCurso < ApplicationRecord
  belongs_to :programa_estudio
  belongs_to :curso
end

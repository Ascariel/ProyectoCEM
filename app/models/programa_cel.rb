class ProgramaCel < ApplicationRecord
  validates :programa_estudio_id, uniqueness: { scope: :cel_id }
end

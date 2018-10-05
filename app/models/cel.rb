class Cel < ApplicationRecord
  has_many :familias
  has_many :programa_cels
  belongs_to :pais

end

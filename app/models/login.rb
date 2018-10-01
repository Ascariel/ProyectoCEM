class Login < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, :password, presence: true
  belongs_to :perfil

  def nombre_perfil
    perfil.nombre
  end

  def es_cem?
    perfil.nombre == 'CEM'
  end

  def es_cel?
    perfil.nombre == 'CEL'
  end

  def es_alumno?
    perfil.nombre == 'ALUMNO'
  end

  def es_familia?
    perfil.nombre == 'FAMILIA'
  end
end

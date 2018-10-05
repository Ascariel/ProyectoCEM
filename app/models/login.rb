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

  def cel
    return nil if es_cel?.blank?

    Cel.find(actor_id)
  end

  def familia
    return nil if es_familia?.blank?

    Familia.find(actor_id)
  end
end

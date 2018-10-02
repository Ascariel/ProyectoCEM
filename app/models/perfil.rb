class Perfil < ApplicationRecord
  has_many :logins

  def es_cem?
    nombre == 'CEM'
  end

  def es_cel?
    nombre == 'CEL'
  end

  def es_alumno?
    nombre == 'ALUMNO'
  end

  def es_familia?
    nombre == 'FAMILIA'
  end
end

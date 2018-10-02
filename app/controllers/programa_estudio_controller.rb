class ProgramaEstudioController < ApplicationController
  def index
    # puts "====  PATH #{programa_estudio_path(ProgramaEstudio.last)}"
  end

  def new
  end

  def create
    curso_ids = params[:cursos]&.values&.map(&:to_i)
    return redirect_to '/programa_estudio/new?alert=cantidad_cursos_invalida' if curso_ids.blank?

    programa_estudio = ProgramaEstudio.find_by(nombre: params[:nombre])
    return redirect_to '/programa_estudio/new?alert=programa_ya_existe' if programa_estudio.present?

    programa_estudio = ProgramaEstudio.create!(nombre: params[:nombre], pais_id: params[:pais_id], max_cupos: params[:max_cupos], min_cupos: params[:min_cupos], duracion: params[:duracion] || 'normal')

    cursos = Curso.where(id: curso_ids)
    cursos.each { |curso| ProgramaCurso.create!(curso_id: curso.id, programa_estudio_id: programa_estudio.id) }

    return redirect_to '/programa_estudio/index'
  end

  # def login_params
  #   params.require(:login).permit(:email, :password, :username, :perfil_id, :pais_id, :tipo_cuenta, :nombre_actor)
  # end
end

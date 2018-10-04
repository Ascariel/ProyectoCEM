class ProgramasEstudioController < ApplicationController
  def index
  end

  def show
    @programa_estudio = ProgramaEstudio.find(params[:id])
  end

  def new
  end

  def create
    curso_ids = params[:cursos]&.values&.map(&:to_i)
    return redirect_to '/programas_estudio/new?alert=cantidad_cursos_invalida' if curso_ids.blank?

    programa_estudio = ProgramaEstudio.find_by(nombre: params[:nombre])
    return redirect_to '/programas_estudio/new?alert=programa_ya_existe' if programa_estudio.present?

    programa_estudio = ProgramaEstudio.create!(nombre: params[:nombre], pais_id: params[:pais_id], max_cupos: params[:max_cupos], min_cupos: params[:min_cupos], duracion: params[:duracion] || 'normal')

    cursos = Curso.where(id: curso_ids)
    cursos.each { |curso| ProgramaCurso.create!(curso_id: curso.id, programa_estudio_id: programa_estudio.id) }

    return redirect_to '/programas_estudio?alert=programa_creado'
  end

  def edit
    @programa_estudio = ProgramaEstudio.find(params[:id])
  end

  def update
    curso_ids = params[:cursos]&.values&.map(&:to_i)
    return redirect_to '/programas_estudio/new?alert=cantidad_cursos_invalida' if curso_ids.blank?

    @programa_estudio = ProgramaEstudio.find(params[:id])
    programa_cursos = @programa_estudio.programa_cursos

    programa_cursos_a_borrar = programa_cursos.where.not(id: curso_ids).destroy_all

    cursos = Curso.where(id: curso_ids)
    cursos.each { |curso| ProgramaCurso.create!(curso_id: curso.id, programa_estudio_id: @programa_estudio.id) }
    binding.pry
    @programa_estudio.update!(programa_estudio_params)
    redirect_to "#{programas_estudio_index_path}?alert=editado"
  end

  def destroy
    ProgramaEstudio.find(params[:id]).destroy
    return redirect_to '/programas_estudio'
  end

  def programa_estudio_params
    params.require(:programa_estudio).permit(:nombre, :pais_id, :max_cupos, :min_cupos, :duracion)
  end
end

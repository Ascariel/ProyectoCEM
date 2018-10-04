class ProgramasCelController < ApplicationController
  def create
    programa_estudio = ProgramaEstudio.find(params[:programa_estudio_id])
    cel = Cel.find(params[:cel_id])
    programa_cel = ProgramaCel.create!(cel_id: cel.id, programa_estudio_id: programa_estudio.id)

    return render json: { success: true, programa_cel: programa_cel }
  end

  def destroy
    programa_cel = ProgramaCel.find(params[:programa_cel_id])
    programa_cel.destroy

    return render json: { success: true }
  end
end
class ProgramasCelController < ApplicationController

  def index
    @programas_cel = ProgramaCel.all
    if @current_user.es_cel?
      @programas_cel = @current_user.cel.programa_cels
    end
  end

  def show
    @programa_cel = ProgramaCel.find(params[:id])
    @programa_estudio = @programa_cel.programa_estudio
    @cel = @programa_cel.cel
  end

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

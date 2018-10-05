class CelsController < ApplicationController

  def index
    @cels = Cel.all
  end

  def show
    @cel = Cel.find(params[:id])
    @familia = @current_user.familia
  end

  def postulaciones_familias
    @cel = @current_user.cel
    @familias = @cel.familias
  end

  def postulacion_familia_cel
    familia = Familia.find(params[:familia_id])
    familia.update!(cel_id: params[:cel_id])
    return render json: { success: true }
  end

  def eliminar_postulacion_familia_cel
    familia = Familia.find(params[:familia_id])
    familia.update!(cel_id: nil)
    return render json: { success: true }
  end
end

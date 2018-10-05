class FamiliasController < ApplicationController
  def index
    @familias = Familia.all
  end

  def postulacion_familia_cel
    @familia = Familia.find(params[:id])
    @cel = @familia.cel
    return redirect_to '/cels?alert=no_tienes_postulaciones' if @cel.blank?

  end
end

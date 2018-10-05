class AlumnosController < ApplicationController
  def index
    @alumnos = Alumno.all
  end
end

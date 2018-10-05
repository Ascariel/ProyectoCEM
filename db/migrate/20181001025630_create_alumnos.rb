class CreateAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :codigo_alumno
      t.timestamps
    end
  end
end

class CreateProgramaEstudios < ActiveRecord::Migration[5.2]
  def change
    create_table :programa_estudios do |t|
      t.string :nombre
      t.integer :pais_id
      t.integer :max_cupos
      t.integer :min_cupos
      t.integer :duracion
      t.timestamps
    end
  end
end

class CreateProgramaCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :programa_cursos do |t|
      t.integer :curso_id
      t.integer :programa_estudio_id
      t.timestamps
    end
  end
end

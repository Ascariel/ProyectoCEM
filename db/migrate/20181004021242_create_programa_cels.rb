class CreateProgramaCels < ActiveRecord::Migration[5.2]
  def change
    create_table :programa_cels do |t|
      t.integer :programa_estudio_id
      t.integer :cel_id
      t.integer :estado, default: 0
      t.timestamps
    end
  end
end

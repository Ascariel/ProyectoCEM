class CreateFamilia < ActiveRecord::Migration[5.2]
  def change
    create_table :familia do |t|
      t.string :nombre
      t.integer :cel_id
      t.integer :pais_id
      t.integer :estado_postulacion_cel, default: 0
      t.timestamps
    end
  end
end

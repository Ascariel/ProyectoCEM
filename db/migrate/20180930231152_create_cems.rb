class CreateCems < ActiveRecord::Migration[5.2]
  def change
    create_table :cems do |t|
      t.string :nombre
      t.string :email
      t.string :telefono
      t.string :pais_id

      t.timestamps
    end
  end
end

class CreateCels < ActiveRecord::Migration[5.2]
  def change
    create_table :cels do |t|
      t.string :nombre
      t.string :pais_id
      t.timestamps
    end
  end
end

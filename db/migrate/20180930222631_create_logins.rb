class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :email
      t.string :username
      t.string :password
      t.integer :actor_id
      t.string :nombre_tabla_actor

      t.timestamps
    end
  end
end

class AddPerfilIdToLogins < ActiveRecord::Migration[5.2]
  def change
    add_column :logins, :perfil_id, :integer
  end
end

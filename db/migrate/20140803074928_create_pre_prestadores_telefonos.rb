class CreatePrePrestadoresTelefonos < ActiveRecord::Migration[5.0]
  def change
    create_table :pre_prestadores_telefonos do |t|
    	t.references :prestador #prestador_id
    	t.references :telefono #ptelefono_id

      t.timestamps
    end
  end
end

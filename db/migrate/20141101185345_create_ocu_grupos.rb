class CreateOcuGrupos < ActiveRecord::Migration
  def change
    create_table :ocu_grupos do |t|
    	t.string :nombre
    	t.string :codigo
    	t.references :gran_grupo #gran_grupo_id
      t.timestamps
    end
  end
end

class CreateOcuSubgrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :ocu_subgrupos do |t|
    	t.string :nombre
    	t.string :codigo
    	t.references :grupo #grupo_id
      t.timestamps
    end
  end
end

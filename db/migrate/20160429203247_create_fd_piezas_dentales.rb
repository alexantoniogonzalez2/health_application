class CreateFdPiezasDentales < ActiveRecord::Migration[5.0]
  def change
    create_table :fd_piezas_dentales do |t|
      t.references :persona
      t.references :tipo_diente
      t.timestamps null: false
    end
  end
end

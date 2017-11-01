class CreateFdPeriodoncias < ActiveRecord::Migration
  def change
    create_table :fd_periodoncias do |t|
    	t.references :atencion_salud
      t.text :comentario
      t.integer :diagnostico
      t.timestamps null: false
    end
  end
end

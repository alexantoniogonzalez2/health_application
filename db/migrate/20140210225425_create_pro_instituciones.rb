class CreateProInstituciones < ActiveRecord::Migration[5.0]
  def change
    create_table :pro_instituciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

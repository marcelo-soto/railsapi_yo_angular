class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
    	t.string :codigo, null: false
    	t.string :descripcion, null: false

      t.timestamps null: false
    end
    add_index :productos, :codigo, unique: true
  end
end

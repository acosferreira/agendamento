class CreateTableProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string  :name
      t.string  :marca
      t.integer :fornecedor_id
      t.string  :description
      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end

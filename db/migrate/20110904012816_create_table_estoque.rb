class CreateTableEstoque < ActiveRecord::Migration
  def self.up
        create_table :estoques do |t|
      t.integer :produto_id
      t.integer :qtd
      t.float   :valor_total
      t.float   :valor_unitario
      t.float   :valor_venda
      t.date    :data_entrada
      t.timestamps
    end
  end

  def self.down
    drop_table :estoques
  end
end

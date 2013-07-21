class CreateTableEntradaProdutos < ActiveRecord::Migration
  def self.up
    create_table :entrada_produtos do |t|
      t.integer :produto_id
      t.integer :qtd
      t.float   :valor_unitarios
      t.float   :valor_total_nota
    end

    remove_column :produtos, :valor_unitario
  end

  def self.down
    drop_table :entada_produtos
    add_column :produtos, :valor_unitario, :float
  end
end

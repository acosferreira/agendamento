class FixValorInEstoqueToProduto < ActiveRecord::Migration
  def self.up
    remove_column :estoques, :valor_total
    remove_column :estoques, :valor_unitario
    remove_column :estoques, :valor_venda

    add_column :produtos, :valor_total, :float
    add_column :produtos, :valor_unitario, :float
    add_column :produtos, :valor_venda, :float
  end

  def self.down
    add_column :estoques, :valor_total, :float
    add_column :estoques, :valor_unitario, :float
    add_column :estoques, :valor_venda, :float

    remove_column :produtos, :valor_total
    remove_column :produtos, :valor_unitario
    remove_column :produtos, :valor_venda
  end
end

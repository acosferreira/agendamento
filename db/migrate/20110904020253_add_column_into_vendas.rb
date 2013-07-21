class AddColumnIntoVendas < ActiveRecord::Migration
  def self.up
    add_column :vendas, :produto_id, :integer
  end

  def self.down
    remove_column :vendas, :produto_id
  end
end

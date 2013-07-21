class CreateTableFornecedores < ActiveRecord::Migration
  def self.up
    create_table :fornecedores do |t|
      t.string  :name
      t.string  :empresa
      t.string  :marca
      t.string :contato
      t.timestamps
    end
  end

  def self.down
    drop_table :fornecedores
  end
end

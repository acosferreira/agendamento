class CreateTableFornecedors < ActiveRecord::Migration
  def self.up
    drop_table :fornecedores
    create_table :fornecedors do |t|
      t.string  :name
      t.string  :empresa
      t.string  :marca
      t.string :contato
      t.timestamps
    end

  end

  def self.down
    drop_table :fornecedors
    create_table :fornecedores do |t|
      t.string  :name
      t.string  :empresa
      t.string  :marca
      t.string :contato
      t.timestamps
    end

  end
end

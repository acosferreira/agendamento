class CreateTableVendas < ActiveRecord::Migration
  def self.up

    create_table :vendas do |t|
      t.integer  :profissional_id
      
      t.integer  :qtd
      t.string  :valor
      t.string :data_venda
      t.timestamps
    end
  end

  def self.down
    drop_table :vendas
  end
end

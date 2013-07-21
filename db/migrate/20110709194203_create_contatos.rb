class CreateContatos < ActiveRecord::Migration
  def self.up
    create_table :contatos do |t|
      t.string :name
      t.string :tipo_contato
      t.integer :cliente_id
      t.integer :estabelecimento_id
      t.integer :profissional_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contatos
  end
end

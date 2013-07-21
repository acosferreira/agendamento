class CreateEstabelecimentoProfissionals < ActiveRecord::Migration
  def self.up
    create_table :estabelecimento_profissionals do |t|
      t.integer :profissional_id
      t.integer :estabelecimento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :estabelecimento_profissionals
  end
end

class CreateEstabelecimentos < ActiveRecord::Migration
  def self.up
    create_table :estabelecimentos do |t|
      t.string :name
      t.string :address
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :uf

      t.timestamps
    end
  end

  def self.down
    drop_table :estabelecimentos
  end
end

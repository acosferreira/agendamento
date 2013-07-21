class CreateProfissionals < ActiveRecord::Migration
  def self.up
    create_table :profissionals do |t|
      t.string :name
      t.string :address
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :gender
      t.date :birth_date
      t.integer :crm
      t.float :percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :profissionals
  end
end

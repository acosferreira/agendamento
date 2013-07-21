class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :name
      t.string :address
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :gender
      t.date :birth_date
      t.integer :type_convenio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end

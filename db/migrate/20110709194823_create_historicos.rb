class CreateHistoricos < ActiveRecord::Migration
  def self.up
    create_table :historicos do |t|
      t.integer :cliente_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :historicos
  end
end

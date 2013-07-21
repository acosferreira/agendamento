class CreateSemanas < ActiveRecord::Migration
  def self.up
    create_table :semanas do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :semanas
  end
end

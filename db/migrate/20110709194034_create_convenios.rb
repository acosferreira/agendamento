class CreateConvenios < ActiveRecord::Migration
  def self.up
    create_table :convenios do |t|
      t.string :name
      t.string :telephone
      t.string :site

      t.timestamps
    end
  end

  def self.down
    drop_table :convenios
  end
end

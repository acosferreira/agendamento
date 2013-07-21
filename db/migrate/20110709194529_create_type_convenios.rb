class CreateTypeConvenios < ActiveRecord::Migration
  def self.up
    create_table :type_convenios do |t|
      t.string :name
      t.float :coverage
      t.integer :convenio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :type_convenios
  end
end

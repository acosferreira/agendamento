class AddColumnIntoSemana < ActiveRecord::Migration
  def self.up
    add_column :semanas , :number_of_weekday, :integer , :limit=>1
  end

  def self.down
    remove_column :semanas, :number_of_weekday
  end
end

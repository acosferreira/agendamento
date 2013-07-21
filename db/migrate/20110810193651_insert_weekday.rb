class InsertWeekday < ActiveRecord::Migration
  def self.up
    Semana.create!(:name=>'Domingo', :number_of_weekday=>0)
    Semana.create!(:name=>'Segunda-Feira', :number_of_weekday=>1)
    Semana.create!(:name=>'Terça-Feira', :number_of_weekday=>2)
    Semana.create!(:name=>'Quarta-Feira', :number_of_weekday=>3)
    Semana.create!(:name=>'Quinta-Feira', :number_of_weekday=>4)
    Semana.create!(:name=>'Sexta-Feira', :number_of_weekday=>5)
    Semana.create!(:name=>'Sábado', :number_of_weekday=>6)

  end

  def self.down
    truncate_table :semanas
  end
end

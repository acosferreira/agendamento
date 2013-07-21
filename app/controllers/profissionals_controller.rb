class ProfissionalsController < ApplicationController
 active_scaffold :profissionals do |config|
   config.columns=[:name, :birth_date, :gender, :address, :number, :complement, :neighborhood , :city, :uf, :crm]
       config.columns[:gender].form_ui =:select
    config.columns[:gender].options = {:options => Enum::GENDER}


    
    config.nested.add_link("Contatos", :contatos)
    config.nested.add_link("Especialidade", :profissional_especialidades)

 end
end

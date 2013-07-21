# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110911012619) do

  create_table "agendas", :force => true do |t|
    t.date     "data"
    t.integer  "cliente_id"
    t.integer  "profissional_especialidade_id"
    t.string   "type_consulta"
    t.float    "value"
    t.float    "value_receive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "horario"
    t.integer  "usuario_id"
  end

  create_table "clientes", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "uf"
    t.string   "gender"
    t.date     "birth_date"
    t.integer  "type_convenio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contatos", :force => true do |t|
    t.string   "name"
    t.string   "tipo_contato"
    t.integer  "cliente_id"
    t.integer  "estabelecimento_id"
    t.integer  "profissional_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenios", :force => true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dia_trabalhos", :force => true do |t|
    t.integer  "profissional_especialidade_id"
    t.integer  "semana_id"
    t.integer  "estabelecimento_profissional_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entrada_produtos", :force => true do |t|
    t.integer "produto_id"
    t.integer "qtd"
    t.float   "valor_unitarios"
    t.float   "valor_total_nota"
  end

  create_table "especialidades", :force => true do |t|
    t.string   "name"
    t.string   "duration"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "percentage"
  end

  create_table "estabelecimento_profissionals", :force => true do |t|
    t.integer  "profissional_id"
    t.integer  "estabelecimento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estabelecimentos", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inicio"
    t.string   "fim"
  end

  create_table "estoques", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "qtd"
    t.date     "data_entrada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fornecedors", :force => true do |t|
    t.string   "name"
    t.string   "empresa"
    t.string   "marca"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos", :force => true do |t|
    t.string   "name"
    t.integer  "grupo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historicos", :force => true do |t|
    t.integer  "cliente_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.string   "url"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissaos", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "grupo_id"
    t.boolean  "view"
    t.boolean  "add"
    t.boolean  "erase"
    t.boolean  "change"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.string   "name"
    t.string   "marca"
    t.integer  "fornecedor_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "valor_total"
    t.float    "valor_venda"
  end

  create_table "profissional_especialidades", :force => true do |t|
    t.integer  "especialidade_id"
    t.integer  "profissional_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profissionals", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "uf"
    t.string   "gender"
    t.date     "birth_date"
    t.integer  "crm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semanas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_weekday", :limit => 1
  end

  create_table "type_convenio_especialidades", :force => true do |t|
    t.integer  "type_convenio_id"
    t.integer  "especialidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_convenios", :force => true do |t|
    t.string   "name"
    t.float    "coverage"
    t.integer  "convenio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt_password"
    t.integer  "grupo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendas", :force => true do |t|
    t.integer  "profissional_id"
    t.integer  "qtd"
    t.string   "valor"
    t.string   "data_venda"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "produto_id"
  end

end

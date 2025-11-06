class CreateCondominiums < ActiveRecord::Migration[5.2]
  def change
    create_table :condominiums do |t|
      t.references :real_estate, null: false, foreign_key: true

      # Dados do condomínio
      t.string :nome, null: false
      t.integer :unidades_por_torre, null: false
      t.text :nomes_torres
      t.string :tipo
      t.date :data_construcao
      t.float :area_total
      t.float :area_comum
      t.decimal :valor_condominio, precision: 10, scale: 2
      t.decimal :taxa_administrativa, precision: 10, scale: 2

      # Localização
      t.string :endereco
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.float :latitude
      t.float :longitude

      # Infraestrutura / amenidades
      t.boolean :piscina, default: false
      t.boolean :churrasqueira, default: false
      t.boolean :playground, default: false
      t.boolean :academia, default: false
      t.integer :estacionamento_coberto, default: 0
      t.integer :estacionamento_descoberto, default: 0
      t.boolean :portaria_24h, default: false
      t.integer :elevadores, default: 0

      # Contato
      t.string :email_administracao
      t.string :telefone_administracao

      t.timestamps
    end
  end
end


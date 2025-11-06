class RemoveRealEstateIdFromRevenues < ActiveRecord::Migration[5.2]
  def change
    # remove a constraint de chave estrangeira (caso ainda exista)
    if foreign_key_exists?(:revenues, :real_estates)
      remove_foreign_key :revenues, :real_estates
    end

    # remove a coluna real_estate_id (se ainda existir)
    if column_exists?(:revenues, :real_estate_id)
      remove_column :revenues, :real_estate_id
    end
  end
end
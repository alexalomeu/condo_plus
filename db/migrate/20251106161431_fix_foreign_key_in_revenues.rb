class FixForeignKeyInRevenues < ActiveRecord::Migration[5.2]
  def change
    # Verifica se a foreign key antiga existe antes de tentar remover
    if foreign_key_exists?(:revenues, :condominia)
      remove_foreign_key :revenues, :condominia
    end

    # Adiciona a nova foreign key, caso ainda não exista
    unless foreign_key_exists?(:revenues, :condominiums)
      add_foreign_key :revenues, :condominiums
    end
  end
end


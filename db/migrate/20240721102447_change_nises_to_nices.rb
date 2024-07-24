class ChangeNisesToNices < ActiveRecord::Migration[6.1]
  def change
    rename_table :nises, :nices
  end
end

class AddIndiceGlyToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :indice_gly, :integer
  end
end

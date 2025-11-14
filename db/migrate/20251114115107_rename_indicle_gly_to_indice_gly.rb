class RenameIndicleGlyToIndiceGly < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :indicle_gly, :indice_gly
  end
end

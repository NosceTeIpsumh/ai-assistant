class AddRatioGlucideToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :ratio_glucide, :integer
  end
end

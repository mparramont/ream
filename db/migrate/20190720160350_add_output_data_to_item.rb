class AddOutputDataToItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :data, :input_data
    add_column :items, :output_data, :json
  end
end

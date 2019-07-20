class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.json :data

      t.timestamps
    end
  end
end

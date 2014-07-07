class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :user
      t.integer :room

      t.timestamps
    end
  end
end

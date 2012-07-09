class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :common_name
      t.string :scientific_name
      t.boolean :accepted, :default => false
      t.integer :hardiness_zone
      t.text :additional_info, :default => "None."

      t.timestamps
    end
  end
end

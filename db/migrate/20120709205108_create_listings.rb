class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :strain
      t.integer :seed_id
      t.integer :seed_quantity
      t.text :description
      t.integer :lister_id
      t.integer :accepted_proposal_id

      t.timestamps
    end
  end
end

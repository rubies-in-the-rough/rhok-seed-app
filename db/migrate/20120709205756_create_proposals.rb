class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :listing_id
      t.integer :seed_id
      t.integer :proposer_id
      t.string :strain
      t.integer :seed_quantity

      t.timestamps
    end
  end
end

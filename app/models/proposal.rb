class Proposal < ActiveRecord::Base
  attr_accessible :listing_id, :seed_id, :proposer_id, :seed_quantity, :strain

  belongs_to :listing
  belongs_to :seed
  belongs_to :proposer, :class_name => "User"
end

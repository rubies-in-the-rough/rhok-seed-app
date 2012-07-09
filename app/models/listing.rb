class Listing < ActiveRecord::Base
  has_one :accepted_proposal, :class_name => "Proposal"
  belongs_to :lister, :class_name => "User"
  belongs_to :seed

  attr_accessible :accepted_proposal_id, :description, :lister_id, :seed_id, :seed_quantity, :strain
end

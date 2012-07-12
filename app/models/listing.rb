class Listing < ActiveRecord::Base
  has_one :accepted_proposal, :class_name => "Proposal"
  has_many :proposals, :class_name => 'Proposal'
  belongs_to :lister, :class_name => "User"
  belongs_to :seed

  attr_accessible :accepted_proposal_id, :description, :lister_id, :seed_id, :seed_quantity, :strain

  scope :find_all_like_strain, lambda { |strain| where('strain like ?', strain).order('strain') }

end

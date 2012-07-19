class Proposal < ActiveRecord::Base
  #whitelist attributes for mass-assignment
  attr_accessible :listing_id, :seed_id, :proposer_id, :seed_quantity, :strain

  #define relationships
  belongs_to :listing
  belongs_to :seed
  belongs_to :proposer, :class_name => "User"

  #attribute validations
  validates_associated :proposer
  validates :proposer_id,
            presence: true
  validate :lister_cant_be_proposer, on: :create

  validates_associated :listing
  validates :listing_id,
            presence: true
  validate :listing_cant_be_closed, on: :create

  validates_associated :seed
  validates :seed_id,
            presence: true

  validates :strain,
            presence: true,
            length: { minimum: 2 }

  validates :seed_quantity,
            numericality: { only_integer: true }

  #Don't allow destruction of accepted proposals. Proposals should be binding.
  before_destroy :disallow_if_accepted_proposal

  def lister_cant_be_proposer
    if proposer_id == Listing.find(listing_id).lister_id
      errors[:base] << "You can't propose on your own listings."
    end
  end

  def listing_cant_be_closed
    unless Listing.find(listing_id).open?
      errors[:base] << "This listing has closed."
    end
  end

  #
  # Check if a proposal has been accepted.
  #
  # @return boolean - true if proposal was chosen for a listing
  #
  def accepted?
    return listing.accepted_proposal_id == id
  end

  #
  # Check if the proposal's listing is unclaimed.
  #
  # @return boolean - true if the listing is unclaimed
  #
  def listing_open?
    return listing.open?
  end

  protected #dont violate object encapsulation

  #
  # Prevent the destruction of an accepted proposal
  #  for record keeping purposes
  #
  def disallow_if_accepted_proposal
    if listing.accepted_proposal and listing.accepted_proposal.id == id
      errors.add(:base, "You can't remove an accepted proposal.") 
    end

    #if blank, return true, and therefore allow destruction
    errors.blank? 
  end

end

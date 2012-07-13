class Proposal < ActiveRecord::Base
  attr_accessible :listing_id, :seed_id, :proposer_id, :seed_quantity, :strain

  belongs_to :listing
  belongs_to :seed
  belongs_to :proposer, :class_name => "User"

  validates_associated :proposer
  validates :proposer_id,
            presence: true
  validate :lister_cant_be_proposer, on: :create

  validates_associated :listing
  validates :listing_id,
            presence: true

  validates_associated :seed
  validates :seed_id,
            presence: true

  validates :strain,
            presence: true,
            length: { minimum: 2 }

  validates :seed_quantity,
            numericality: { only_integer: true }

  def lister_cant_be_proposer
    if proposer_id == Listing.find(listing_id).lister_id
      errors.add(:proposer_id, "can't propose on own listings.")
    end
  end

end

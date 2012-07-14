class Listing < ActiveRecord::Base
  attr_accessible :accepted_proposal_id, :description, :lister_id, :seed_id, :seed_quantity, :strain

  has_one :accepted_proposal, :class_name => "Proposal"
  has_many :proposals, :class_name => 'Proposal', dependent: :destroy
  has_many :proposal_users, through: :proposals, source: :user
  belongs_to :lister, :class_name => "User"
  belongs_to :seed

  validates_associated :seed
  validates :seed_id,
            presence: true

  validates_associated :lister
  validates :lister_id,
            presence: true

  validates :strain,
            presence: true,
            length: { minimum: 2 }

  validates :seed_quantity,
            numericality: { only_integer: true }

  scope :find_all_like_strain, lambda { |strain| where('strain like ?', strain).order('strain') }

  scope :open, where( accepted_proposal_id: nil )
  scope :closed, where( "accepted_proposal_id IS NOT NULL" )

  def open?
    return accepted_proposal_id == nil
  end

end

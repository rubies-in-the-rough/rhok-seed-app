class User < ActiveRecord::Base
  #set up authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #define relationships
  has_many :listings, foreign_key: :lister_id, dependent: :destroy
  has_many :proposals, foreign_key: :proposer_id, dependent: :destroy
  has_many :needs, dependent: :destroy
  has_many :needed_seeds, through: :needs, source: :seed

  #class specific queries
  scope :locked, where("locked_at IS NOT NULL")

  scope :find_all_like_email, lambda { |email| where('email like ?', email).order('email') }

  #
  # Check if a user needs a specific seed
  #
  # @return boolean - true if the user has marked the seed as needed
  #
  def needing?(seed)
    needs.find_by_seed_id(seed.id)
  end

  #
  # Mark a seed as needed by the user
  #
  def need!(seed)
    needs.create!(seed_id: seed.id)
  end

  # 
  # Mark a seed as unneeded by a user
  #
  def unneed!(seed)
    needs.find_by_seed_id(seed.id).destroy
  end

end

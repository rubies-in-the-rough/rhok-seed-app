class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  scope :locked, where("locked_at IS NOT NULL")

  #prolly want to use a join here, but im unsure until we actually get the
  #listings code written. something like
  #scope :with_listings, joins(:listings).where(listings.length > 0)
  #just a stub for now
  scope :with_listings, where(true)

  has_many :listings
  has_many :proposals
  has_many :needs, dependent: :destroy
  has_many :needed_seeds, through: :needs, source: :seed

  def needing?(seed)
    needs.find_by_seed_id(seed.id)
  end

  def need!(seed)
    needs.create!(seed_id: seed.id)
  end

  def unneed!(seed)
    needs.find_by_seed_id(seed.id).destroy
  end

end

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

  has_many :listings, foreign_key: :lister_id
  has_many :proposals, foreign_key: :proposer_id
  has_many :needs
end

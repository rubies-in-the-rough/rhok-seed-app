class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :listings, foreign_key: :lister_id, dependent: :destroy
  has_many :proposals, foreign_key: :proposer_id, dependent: :destroy
  has_many :needs, dependent: :destroy
  has_many :needed_seeds, through: :needs, source: :seed

  scope :locked, where("locked_at IS NOT NULL")

  scope :find_all_like_email, lambda { |email| where('email like ?', email).order('email') }

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

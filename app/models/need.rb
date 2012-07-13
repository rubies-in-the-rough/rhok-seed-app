class Need < ActiveRecord::Base
  attr_accessible :seed_id, :user_id

  belongs_to :seed
  belongs_to :user

  validates_associated :seed
  validates :seed_id,
            presence: true

  validates_associated :user
  validates :user_id,
            presence: true

end

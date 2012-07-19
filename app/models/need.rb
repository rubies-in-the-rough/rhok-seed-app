class Need < ActiveRecord::Base
  #whitelist attributes for mass-assignemtn
  attr_accessible :seed_id, :user_id

  #define related models
  belongs_to :seed
  belongs_to :user

  #attribute validations
  validates_associated :seed
  validates :seed_id,
            presence: true

  validates_associated :user
  validates :user_id,
            presence: true

end

class Need < ActiveRecord::Base
  belongs_to :seed
  belongs_to :user

  attr_accessible :seed_id, :user_id

  validates :seed_id, presence: true
  validates :user_id, presence: true
end

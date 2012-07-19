class Seed < ActiveRecord::Base
  #whitelist attributes for mass-assignment
  attr_accessible :accepted, :common_name, :hardiness_zone, :scientific_name, :additional_info

  #define relationships
  has_many :listings, dependent: :destroy
  has_many :proposals, dependent: :destroy

  #attribute validations
  validates :common_name,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }

  validates :scientific_name,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }

  validates :hardiness_zone,
            presence: true,
            numericality: { only_integer: true }

  validates :accepted,
            presence: true,
            inclusion: { in: [true, false] }

  #class specific query scopes
  scope :accepted, where(:accepted => true)
  scope :unaccepted, where(:accepted => false)

  scope :find_all_like_common_name, lambda { |common_name| where('common_name like ?', common_name).order('common_name') }
  scope :find_all_like_scientific_name, lambda { |scientific_name| where('scientific_name like ?', scientific_name).order('scientific_name') }
  scope :find_all_in_hardiness_zone, lambda { |hardiness_zone| where('hardiness_zone like ?', hardiness_zone).order('hardiness_zone') }

end

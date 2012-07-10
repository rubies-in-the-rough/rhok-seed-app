class Seed < ActiveRecord::Base
  attr_accessible :accepted, :common_name, :hardiness_zone, :scientific_name, :additional_info

  has_many :listings
  has_many :proposals

  scope :accepted, where(:accepted => true)
  scope :unaccepted, where(:accepted => false)
end

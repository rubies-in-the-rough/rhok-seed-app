class Seed < ActiveRecord::Base
  attr_accessible :accepted, :common_name, :hardiness_zone, :scientific_name, :additional_info

  has_many :listings
  has_many :proposals
end

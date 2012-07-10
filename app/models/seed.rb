class Seed < ActiveRecord::Base
  attr_accessible :accepted, :common_name, :hardiness_zone, :scientific_name, :additional_info

  has_many :listings
  has_many :proposals

  scope :accepted, where(:accepted => true)
  scope :unaccepted, where(:accepted => false)

  scope :find_all_like_common_name, lambda { |common_name| where('common_name like ?', common_name).order('common_name') }
  scope :find_all_like_scientific_name, lambda { |scientific_name| where('scientific_name like ?', scientific_name).order('scientific_name') }
  scope :find_all_in_hardiness_zone, lambda { |hardiness_zone| where('hardiness_zone like ?', hardiness_zone).order('hardiness_zone') }

end

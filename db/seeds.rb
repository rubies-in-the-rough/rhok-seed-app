# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [
 
  #example user
  {
    :email => 'example@example.com',
    :password => 'example',
    :password_confirmation => 'example',
  },
 
  #example admin
  {
    :email => 'admin@example.com',
    :password => 'example',
    :password_confirmation => 'example',
    :admin => true
  },
 
  #example locked user
  {
    :email => 'locked@example.com',
    :password => 'example',
    :password_confirmation => 'example',
    :locked_at => "#{Time.now}",
    :failed_attempts => 4
  }
]
 
seeds = [
 
  #example accepted seeds
  {
    :common_name => "Corn",
    :scientific_name => "Zea Mays",
    :hardiness_zone => "4",
    :additional_info => "Tastes delicious! Requires moderate sunlight.",
    :accepted => true
  },
  {
    :common_name => "Orange",
    :scientific_name => "Oranginumus",
    :hardiness_zone => "8",
    :additional_info => "Requires constant sunlight and at least weekly rainfall of 3 inches.",
    :accepted => true
  },
  {
    :common_name => "Peach",
    :scientific_name => "Georgipum",
    :hardiness_zone => "7",
    :additional_info => "Best grown in Georgia.",
    :accepted => true
  },

  #example unaccepted seed
  {
    :common_name => "Wheat",
    :scientific_name => "Triticum",
    :hardiness_zone => "6",
    :additional_info => "Harvest in Fall. Key ingredient in Wheaties cereal."
  }
]

users.each do |hash|
  begin
    olduser = User.find_by_email(hash[:email]) 
    olduser.destroy if olduser

    newuser = User.new
    hash.each do |attribute, value|
      newuser.update_attribute(attribute, value)
    end
  rescue Exception => e
    puts e.message
    puts e.class
  end
end

 
seeds.each do |hash|
  begin
    oldseed = Seed.find_by_common_name(hash[:common_name]) 
    oldseed.destroy if oldseed

    newseed = Seed.new
    hash.each do |attribute, value|
      newseed.update_attribute(attribute, value)
    end
  rescue Exception => e
    puts e.message
    puts e.class
  end
end

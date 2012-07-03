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

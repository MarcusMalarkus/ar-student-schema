require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, :uniqueness => true
  validates :age, :numericality => {:greater_than => 5 }
  validates :phone, :format => {:with => /.*\d{3}.*\d{3}.*\d{4}.*/}

  def name 
    first_name + " " + last_name
  end

  def age
    Time.now.year - birthday.year
  end

end

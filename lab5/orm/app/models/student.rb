class Student < ActiveRecord::Base
  attr_accessible :department_id, :firstname, :lastname
  belongs_to :department
end

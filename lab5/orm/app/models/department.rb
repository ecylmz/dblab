class Department < ActiveRecord::Base
  attr_accessible :faculty_id, :name
  belongs_to :faculty
  has_many   :student
end

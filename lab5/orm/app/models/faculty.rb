class Faculty < ActiveRecord::Base
  attr_accessible :name
  has_many :department
end

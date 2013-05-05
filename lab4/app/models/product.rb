class Product < ActiveRecord::Base
  attr_accessible :features, :name, :price
end

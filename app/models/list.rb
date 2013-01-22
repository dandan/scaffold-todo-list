class List < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name
end

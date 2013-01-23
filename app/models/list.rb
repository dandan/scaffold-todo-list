class List < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :category_id

  validates_presence_of :category_id

  has_many :tasks

end

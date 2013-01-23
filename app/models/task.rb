class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :name, :list_id

  validates_presence_of :list_id
end

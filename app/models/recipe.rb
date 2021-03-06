class Recipe < ActiveRecord::Base
  belongs_to :chef
  
  validates :name, presence :true, length:{minimum: 5, maximum: 50}
  validates :summary, presence :true, length:{minimum: 10, maximum: 150}
  validates :description, presence :true, length:{minimum: 50, maximum: 500}
end